<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\CdRole;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(MdProductCategorySeeder::class);
        $this->call(MdProductSeeder::class);
        $this->call(CdClientSeeder::class);
        $this->call(CdBrandSeeder::class);
        $this->call(CdBranchSeeder::class);
        $this->call(GdCountrySeeder::class);
        $this->call(CdRoleSeeder::class);
        $this->call(UserSeeder::class);




        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
