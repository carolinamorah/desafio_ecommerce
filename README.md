# README

DESAFÍO ECOMMERCE Y USANDO UN CONTROLADOR

-1. **Hacer un diagrama de modelos para cubrir las necesidades del cliente**.

El diagrama está en la raíz del proyecto en formato pdf.

-2. **Crear la o las relaciones y modelos para manejar los productos y sus variaciones**.
*Tip: utilizar scaffold e identificar los modelos que lo requieren*.

Del proyecto original cree el modelo *Variant* y lo relacioné con el modelo *Product*, donde un producto tiene muchas variantes y una variante pertenece a un producto.


-3. **Crear la o las relaciones y modelos para manejar las tallas y colores de las variaciones**.

Cree los modelos *Size*, *Color* y *Variant* con las siguientes relaciones:

```
class Size < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants
end
```

```
class Color < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants
end
```

```
class Variant < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :color
end
```

-4. **Implementar la solución para manejar distintos niveles de categorías y asegurarse que no tenga dos padres. También deberás implementar un test unitario para verificar este comportamiento**.

En el Modelo *Category* se crea la columna *category_id* (donde vendrá el id del padre) de esta manera se hace referencia a sí misma para asegurar que no tenga dos padres y cada categoría creada puede, a su vez, tener o no tener hijos.

La relación en el modelo *Category* funcionará así:

```
class Category < ApplicationRecord
    belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true

    has_many :children, class_name: 'Category', dependent: :destroy
end
```


(El test unitario está en spec/models/category_spec.rb. Como ayuda, se instaló la gema *factory_bot_rails*)

-5. **Generar un método o scope en las categorías, de tal forma que entregue una lista de cada categoría padre y otro de sus hijos, y los hijos de sus hijos, en todos los niveles**.

Cree dos métodos en el modelo *Category*:

```
def all_children
    self.children.flat_map do|child|
      child.all_children << child
    end
end
```

-Este método devuelve una lista de las categorías hijas en formato array.

```
def self.all_parents
    where(category_id: nil)
end
```

-El segundo método trae a todas las categorías padre, que se caracterizan por tener category_id:nil  


-6. **Según su diseño, explicar al cliente cómo implementar la lista de productos del catálogo**. **(de un ejemplo en código). Si un modelo necesita código,debes entregarlo**
**al cliente como parte de la implementación**.


Para mostrar solo los productos con stock, se implementó en el modelo *Product* el método *products_with_stock*. 

```
def self.products_with_stock
    products_with_stock = []
    self.all.each do |product|
      if product.variants.first && product.variants.first.stock > 0
        products_with_stock << product
      end
    end
    products_with_stock
  end
```


--El método buscará en todos los productos aquellos que tengan stock mayor a 0

--Para usar correctamente el método se debe reemplazar una parte del código en el archivo "products_controller.rb". El cambio sería el siguiente:

(El código original muestra todos los productos sin discriminar por stock)

```
def index
  @products = Product.all
end
```

(Al cambiar el .all por el nombre del método *products_with_stock*, se mostrarán en el catálogo solo los productos con stock disponible.)

```
def index
  @products = Product.products_with_stock
end
```


-7. **Implementar o explicar las modificaciones (si las hay)** **al modelo OrderItem para que siga funcionando sin que afecte el resto del sistema**.

No hice cambios al modelo *Order_Item*

-8. **Nuestro cliente, a último minuto nos solicita que nuestro sistema soporte cupones**
**de dos tipos: para RR.SS y para un cliente**

Se crea un modelo *Cupón* asociado a un usuario, con atributos como código, tipo (para saber si es para un solo cliente específico o muchas personas), monto de cupón, tipo de descuento(por porcentaje o por monto) y contabilización (para saber cuánto cupo queda).

Para realizar el descuento se crean 3 métodos que definen si el cupón es todavía usable y un cómputo total que realiza la operación en caso de que sean por porcentaje o por monto específico.

```
def usable?
    valid_on_count?
end
```

```
def valid_on_count?
    if kind.eq?('target')
      return(count>0)
    end
end
````

````
def compute_total(total)
    if discount.eq?('percent')
      percent_value = amount.to_f /100
      total - (total * percent_value)
    else
      total = total - amount
      (total < 0) ? 0 :total
    end
end
```










  










