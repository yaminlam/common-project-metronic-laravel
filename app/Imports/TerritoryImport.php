<?php

namespace App\Imports;

use App\Models\Territory;
use Maatwebsite\Excel\Concerns\ToModel;
use App\Models\TerritoryType;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;

class TerritoryImport implements ToModel, WithHeadingRow, WithValidation
{
     private $errors = [];

    /**
     * Process each row and insert it into the database.
     */
    public function model(array $row)
    {

     
        try {
            // Find the territory type ID based on the provided name
            $territoryType = TerritoryType::where('name', $row['territory_type'])->first();

            if (!$territoryType) {
                $this->errors[] = "Territory type '{$row['territory_type']}' not found.";
                return null; // Skip this row
            }

            return new Territory([
                'name' => $row['name'],  
                'code' => $row['code'],  
                'territory_type_id' => $territoryType->id, // Assign the ID
                'is_active' => (bool) $row['is_active'], // Convert to boolean
            ]);
        } catch (\Exception $e) {
            $this->errors[] = "Error processing row: " . json_encode($row) . " - " . $e->getMessage();
            return null; // Skip this row
        }
    }

    /**
     * Define validation rules.
     */
    public function rules(): array
    {
        return [
            '*.name' => 'required|string|max:255',
            '*.code' => 'nullable|max:50',
            '*.territory_type' => 'required|string|max:255',
            '*.is_active' => 'nullable|integer|in:0,1',
        ];
    }

    /**
     * Get errors after import.
     */
    public function getErrors()
    {
        return $this->errors;
    }
}
