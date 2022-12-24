///renove space 

$cleanString = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $request['search'])));
$this->query = customer::where(function($query) use ($cleanString) {
    $query->orWhere(DB::raw('CONCAT(name, " ", family)'), 'LIKE', '%' . $cleanString . '%')
        ->orWhere('name', 'LIKE', "%{$cleanString}%")
        ->orWhere('family', 'LIKE', "%{$cleanString}%");
})->get();
