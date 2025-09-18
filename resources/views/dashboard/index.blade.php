@extends('layouts.base')

@section('title', 'Dashboard')

@section('breadcrumb')

@endsection

@section('content')

    <div class="container-fluid">
        <div class="row g-5 gx-xl-10 mb-5 mb-xl-10">
            <div class="col-xl-3">
                <div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100 bg-primary"
                    style="background-image:url({{ asset('theme/media/svg/shapes/wave-bg-red.svg') }})">
                    <div class="card-body ">
                        <div class="d-flex align-items-center">
                            <span class="fs-2hx text-white fw-bold me-6">-</span>
                        </div>
                        <p class="fs-3 fw-bold text-white py-2">Label 1</p>
                    </div>
                </div>
            </div>

            <div class="col-xl-3">
                <div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100 bg-warning"
                    style="background-image:url({{ asset('theme/media/svg/shapes/wave-bg-red.svg') }})">
                    <div class="card-body ">
                        <div class="d-flex align-items-center">
                            <span class="fs-2hx text-white fw-bold me-6">-</span>
                        </div>
                        <p class="fs-3 fw-bold text-white py-2">Label-2</p>
                    </div>
                </div>
            </div>

            @if ($is_admin_user)
                <div class="col-xl-3">
                    <div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100 bg-success"
                        style="background-image:url({{ asset('theme/media/svg/shapes/wave-bg-red.svg') }})">
                        <div class="card-body ">
                            <div class="d-flex align-items-center">
                                <span class="fs-2hx text-white fw-bold me-6">-</span>
                            </div>
                            <p class="fs-3 fw-bold text-white py-2">Label-3</p>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3">
                    <div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100 bg-info"
                        style="background-image:url({{ asset('theme/media/svg/shapes/wave-bg-red.svg') }})">
                        <div class="card-body ">
                            <div class="d-flex align-items-center">
                                <span class="fs-2hx text-white fw-bold me-6">-</span>
                            </div>
                            <p class="fs-3 fw-bold text-white py-2">Label-4</p>
                        </div>
                    </div>
                </div>
            @endif

        </div>
    </div>

@endsection
