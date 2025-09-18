<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ env('APP_NAME') }} | Login</title>

    <meta name="description" content="Momenta">
    <meta name="author" content="Appinion BD Ltd">
    <meta name="robots" content="noindex, nofollow">

    <link rel="shortcut icon" href="{{ asset("img/favicon.ico") }}" />
    <!--begin::Fonts(mandatory for all pages)-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
    <link href="{{ asset("theme/plugins/global/plugins.bundle.css") }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset("theme/css/style.bundle.css") }}" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
    <script>
        // Frame-busting to prevent site from being loaded within a frame without permission (click-jacking)
        if (window.top != window.self) { window.top.location.replace(window.self.location.href); }
    </script>
</head>
<!--end::Head-->
<!--begin::Body-->

<body id="kt_body" class="app-blank bgi-size-cover bgi-attachment-fixed bgi-position-center bgi-no-repeat">
    <!--begin::Theme mode setup on page load-->
    <script>
        var defaultThemeMode = "light";
        var themeMode;
        if (document.documentElement) {
            if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
                themeMode = document.documentElement.getAttribute("data-bs-theme-mode");
            } else {
                if (localStorage.getItem("data-bs-theme") !== null) {
                    themeMode = localStorage.getItem("data-bs-theme");
                } else {
                    themeMode = defaultThemeMode;
                }
            }
            if (themeMode === "system") {
                themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
            }
            document.documentElement.setAttribute("data-bs-theme", themeMode);
        }
    </script>
    <!--end::Theme mode setup on page load-->
    <!--begin::Root-->
    <div class="d-flex flex-column flex-root" id="kt_app_root">
        <!--begin::Page bg image-->
        <style>
            body {
                background-image: url('{{ asset("theme/media/auth/bg103.jpg") }}');
            }

            [data-bs-theme="dark"] body {
                background-image: url('{{ asset("theme/media/auth/bg103.jpg") }}');
            }
        </style>
        <!--end::Page bg image-->
        <!--begin::Authentication - Sign-in -->
        <div class="d-flex flex-column flex-column-fluid flex-lg-row">
            <!--begin::Aside-->
            <div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10">
                <!--begin::Aside-->
                <div class="d-flex flex-center flex-lg-start flex-column">
                    <!--begin::Logo-->
                    <a href="{{ route('dashboard') }}" class="mb-7">
                        {{-- <img alt="Logo" src="{{ asset("img/healthy_logo_white.svg") }}" style="width: 280px;" /> --}}
                        <img alt="Logo" src="{{ asset("img/appinion-logo.svg") }}" style="width: 300px;" />
                        {{-- <h2>Healthy</h2> --}}
                    </a>
                    <!--end::Logo-->
                    <!--begin::Title-->
                    {{-- <h2 class="text-white fw-normal m-0">Healthy Platform Tagline</h2> --}}
                    <!--end::Title-->
                </div>
                <!--begin::Aside-->
            </div>
            <!--begin::Aside-->
            <!--begin::Body-->
            <div
                class="d-flex flex-column-fluid flex-lg-row-auto justify-content-center justify-content-lg-end p-12 p-lg-20">
                <!--begin::Card-->
                <div class="bg-body d-flex flex-column align-items-stretch flex-center rounded-4 w-md-600px p-20">
                    <!--begin::Wrapper-->
                    <div class="d-flex flex-center flex-column flex-column-fluid px-lg-10 pb-15 pb-lg-20">
                        {{-- <x-alert /> --}}
                        @yield('content')

                    </div>
                    <!--end::Wrapper-->
                    <!--begin::Footer-->
                    {{-- <div class="d-flex flex-stack"> --}}
                    <div class="">
                        <div class="text-center">
                            Designed & developed by <a href="https://appinionbd.com" class="text-md text-success text-hover-primary"><b>Appinion BD Limited</b></a>
                        </div>
                    </div>
                    <!--end::Footer-->
                </div>
                <!--end::Card-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Authentication - Sign-in-->
    </div>
    <!--end::Root-->
    <!--begin::Javascript-->
    <script>
        var hostUrl = "assets/";
    </script>
    <!--begin::Global Javascript Bundle(mandatory for all pages)-->
    <script src="{{ asset("theme/plugins/global/plugins.bundle.js") }}"></script>
    <script src="{{ asset("theme/js/scripts.bundle.js") }}"></script>
    <!--end::Global Javascript Bundle-->
    <!--begin::Custom Javascript(used for this page only)-->
    <script src="{{ asset("theme/js/custom/authentication/sign-in/general.js") }}"></script>
    <!--end::Custom Javascript-->
    <!--end::Javascript-->
</body>
<!--end::Body-->

</html>
