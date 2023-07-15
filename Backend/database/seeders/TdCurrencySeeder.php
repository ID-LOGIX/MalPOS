<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\GdCountry;
use PragmaRX\Countries\Package\Countries;

class GdCountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $countries = Countries::all()
            ->pluck('name.common', 'cca2')
            ->map(function ($countryName, $countryCode) {
                return [
                    'gd_country_code' => $countryCode,
                    'country_name' => $countryName,
                ];
            })
            ->toArray();

        // Insert the countries into the database
        foreach ($countries as $country) {
            GdCountry::create($country);
        }
    }
}
