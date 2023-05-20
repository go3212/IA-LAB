(definstances ingredients

    ([Rice] of Ingredient
         (Name  "Rice")
         (NutritionalValue (make-instance of NutritionalValue (Calories 130) (Protein 2.7) (Carbohydrates 28) (Fat 0.3) (Fiber 0.6) (Sodium 1) (Sugar 0.1) (Vitamins (make-instance of Vitamins (A 0) (B 0.1) (B2 0) (C 0) (D 0) (E 0.1) (K 0))) (Minerals (make-instance of Minerals (Calcium 10) (Iron 0.2) (Magnesium 19) (Potassium 35) (Zinc 0.6)))))
    )

    ([Wheat] of Ingredient
         (Name  "Wheat")
         (NutritionalValue (make-instance of NutritionalValue (Calories 339) (Protein 13.2) (Carbohydrates 72) (Fat 1.5) (Fiber 10.7) (Sodium 2) (Sugar 0.4) (Vitamins (make-instance of Vitamins (A 0) (B 0.3) (B2 0.1) (C 0) (D 0) (E 0.8) (K 1.9))) (Minerals (make-instance of Minerals (Calcium 34) (Iron 3.9) (Magnesium 138) (Potassium 431) (Zinc 2.9))))
    )
    
    ([Rice] of Ingredient
         (Name  "Rice")
         (Allergens "None")
         (NutritionalValue (make-instance of NutritionalValue (Calories 130) (Protein 2.7) (Carbohydrates 28) (Fat 0.3) (Fiber 0.6) (Sodium 1) (Sugar 0.1) (Vitamins (make-instance of Vitamins (A 0) (B 0.1) (B2 0) (C 0) (D 0) (E 0.1) (K 0))) (Minerals (make-instance of Minerals (Calcium 10) (Iron 0.2) (Magnesium 19) (Potassium 35) (Zinc 0.6)))))
    )

    ([Wheat] of Ingredient
         (Name  "Wheat")
         (Allergens "Wheat")
         (NutritionalValue (make-instance of NutritionalValue (Calories 339) (Protein 13.2) (Carbohydrates 72) (Fat 1.5) (Fiber 10.7) (Sodium 2) (Sugar 0.4) (Vitamins (make-instance of Vitamins (A 0) (B 0.3) (B2 0.1) (C 0) (D 0) (E 0.8) (K 1.9))) (Minerals (make-instance of Minerals (Calcium 34) (Iron 3.9) (Magnesium 138) (Potassium 431) (Zinc 2.9))))
    )

    ([Eggs] of Ingredient
         (Name  "Eggs")
         (Allergens "Eggs")
         (NutritionalValue (make-instance of NutritionalValue (Calories 68) (Protein 5.5) (Carbohydrates 0.6) (Fat 4.8) (Fiber 0) (Sodium 70) (Sugar 0.6) (Vitamins (make-instance of Vitamins (A 244) (B 0.1) (B2 0.3) (C 0) (D 41) (E 1) (K 0))) (Minerals (make-instance of Minerals (Calcium 25) (Iron 0.9) (Magnesium 6) (Potassium 63) (Zinc 0.6))))
    )
    ([Apple] of Ingredient
         (Name "Apple")
         (Allergens "none")
         (NutritionalValues (make-instance of NutritionalValue
                                    (Calories 52)
                                    (Carbohydrates 14)
                                    (Fat 0.2)
                                    (Fiber 2.4)
                                    (Protein 0.3)
                                    (Sodium 1)
                                    (Sugar 10.4)))
         (Vitamins (make-instance of Vitamins
                                    (A 3)
                                    (B 0.03)
                                    (B2 0.03)
                                    (C 4.6)
                                    (D 0)
                                    (E 0.18)
                                    (K 2.2)))
         (Minerals (make-instance of Minerals
                                    (Calcium 6)
                                    (Iron 0.12)
                                    (Magnesium 5)
                                    (Potasium 107)
                                    (Zinc 0.04))))
    ([Banana] of Ingredient
         (Name "Banana")
         (Allergens "none")
         (NutritionalValues (make-instance of NutritionalValue
                                    (Calories 96)
                                    (Carbohydrates 23)
                                    (Fat 0.3)
                                    (Fiber 2.6)
                                    (Protein 1.1)
                                    (Sodium 1)
                                    (Sugar 17.2)))
         (Vitamins (make-instance of Vitamins
                                    (A 64)
                                    (B 0.4)
                                    (B2 0.1)
                                    (C 8.7)
                                    (D 0)
                                    (E 0.1)
                                    (K 0.5)))
         (Minerals (make-instance of Minerals
                                    (Calcium 5)
                                    (Iron 0.26)
                                    (Magnesium 27)
                                    (Potasium 358)
                                    (Zinc 0.15))))
)
