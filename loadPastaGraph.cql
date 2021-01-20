// ---- NODES ----

// Ingredient Families
LOAD CSV WITH HEADERS FROM "file:///families.csv" as row
MERGE (n:Family {familyID: row.familyID })
SET n.family = row.family
RETURN n;

// Recipes
LOAD CSV WITH HEADERS FROM "file:///recipes.csv" as row
MERGE(n:Recipe {recipeID: row.recipeID})
SET n.recipe = row.recipe
RETURN n;


// ---- RELATIONSHIPS ----

// (Family) -[IN]-> (Recipe)
LOAD CSV WITH HEADERS FROM "file:///familyRecipe.csv" as row
MERGE (f:Family {familyID: row.familyID})
MERGE (r:Recipe {recipeID: row.recipeID})
MERGE (f)-[:IN]->(r)
RETURN f, r;
