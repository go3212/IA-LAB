(definstances Ingredients
    ([Rice] of Ingredient
         (Name  "Rice")
         (NutritionalValue (make-instance of NutritionalValue (Calories 130) (Protein 2.7) (Carbohydrates 28) (Fat 0.3) (Fiber 0.6) (Sodium 1) (Sugar 0.1) (Vitamins (make-instance of Vitamins (A 0) (B 0.1) (B2 0) (C 0) (D 0) (E 0.1) (K 0))) (Minerals (make-instance of Minerals (Calcium 10) (Iron 0.2) (Magnesium 19) (Potassium 35) (Zinc 0.6)))))
    )
)
