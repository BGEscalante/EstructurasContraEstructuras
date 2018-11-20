
def empty_pila(pila_numero)
    if pila_numero[:tope] == nil
        return pila_numero
    end
end

def empty_cola(cola_numero)
    if cola_numero[:tope] == nil && cola_numero[:final] == nil
        return cola_numero
    end
end

def empty_lista_numero(lista_numero)
    if lista_numero[:tope] == nil && lista_numero[:final] == nil
        return lista_numero
    end
end

def empty_copia(copia)
    if copia[:tope] == nil && copia[:final] == nil
        return copia
    end
end

def empty_copia_mayor(copia_mayor)
    if copia_mayor[:tope] == nil && copia_mayor[:final] == nil
        return copia_mayor
    end
end

def empty_copia_lista(copia_lista)
    if copia_lista[:tope] == nil && copia_lista[:final] == nil
        return copia_lista
    end
end

pila_numero = {
  tope: nil,
  max: -1,
  size: 0
}
 
cola_numero = {
  tope: nil,
  final: nil,
  max: -1,
  size: 0
}

lista_numero = {
  tope: nil,
  final: nil,
  max: -1,
  size: 0
}

copia_lista = {
  tope: nil,
  final: nil,
  max: -1,
  size: 0
}

copia = {
  tope: nil,
  max: -1,
  size: 0
}

copia_mayor = {
  tope: nil,
  max: -1,
  size: 0
}

def obtener_numero(lista_numero, posicion)
    numero = {}
    i = 0
    aux = lista_numero[:tope]
    loop do
        if i == posicion
            numero = aux
            return numero
        end
        if aux[:next] == nil
            break
        end
        i += 1
        aux = aux[:next]
    end
    return numero
end


# Agregar el número a cada estructura
def Agregar_numero_cola(cola_numero, num)
    if empty_cola(cola_numero)  # Si la cola está vacía, agrega el número en la primera posición
        nuevo_numero = {
            numero: num,
            position: 0,
            next: nil
        }
        cola_numero[:tope] = nuevo_numero
        cola_numero[:final] = nuevo_numero

    else # Si no está vacía, lo agrega en la posición actual 
        nuevo_numero = {
            numero: num,
            position: cola_numero[:size],
            next: nil
        }
        ultimo_numero = cola_numero[:final]
        ultimo_numero[:next] = nuevo_numero
        cola_numero[:final] = nuevo_numero
    end
    cola_numero[:size] += 1
end 

def Agregar_numero_pila(pila_numero, num)
    if empty_pila(pila_numero) # Si la pila_numeros está vacía, agrega el número en la primera posición
        nuevo_numero = {
        numero: num,
        position: 0,
        next: nil
        }
        pila_numero[:tope] = nuevo_numero

    else   # Si no está vacía, lo agrega en la posición actual 
        nuevo_numero = {
        numero: num,
        position: pila_numero[:size],
        next: nil
        }
        ultimo_numero = pila_numero[:tope]
        ultimo_numero[:next] = nuevo_numero
        pila_numero[:tope] = nuevo_numero
    end
    pila_numero[:size] += 1
end 

def Agregar_numero_lista(lista_numero, num)
    if empty_lista_numero(lista_numero) # Si la lista_numero está vacía, agrega el número en la primera posición
        nuevo_numero = {
            numero: num,
            position: 0,
            next: nil
        }
        lista_numero[:tope] = nuevo_numero
        lista_numero[:final] = nuevo_numero

    else   # Si no está vacía, lo agrega en la posición actual 
        nuevo_numero = {
            numero: num,
            position: lista_numero[:size],
            next: nil
        }
        ultimo_numero = lista_numero[:final]
        ultimo_numero[:next] = nuevo_numero
        lista_numero[:final] = nuevo_numero
    end
    lista_numero[:size] += 1
end


def eliminar_de_pila(pila_numero, copia)
    numero = pila_numero[:tope]
    copiar_numero(copia, numero)
    if numero == nil
        puts "No hay elementos a eliminar"
        pila_numero[:tope] = nil
    else
    puts "Se ha eliminado el elemento: #{numero[:numero]}"
    pila_numero[:tope] = numero[:next]
    numero = nil
    end
    pila_numero[:size] -= 1
end


def eliminar_de_cola(cola_numero)
    if empty_cola(cola_numero)
        puts "Cola vacía"
    else 
        #puts "Se eliminará el número #{cola_numero[:tope][:numero]} que está en el tope"
        aux = cola_numero[:tope]
        nextt = aux[:next]
        cola_numero[:tope] = nextt
        nextt = nil
        cola_numero[:size] -= 1
        auxx = cola_numero[:tope]
        loop do 
            nexxt = auxx[:next] 
            if nexxt == nil 
                auxx[:position] -= 1
                break
            end 
            auxx[:position] -= 1
            auxx = auxx[:next]
        end 
    end
end


def eliminar_lista_numero(lista_numero, position)
    if empty_lista_numero(lista_numero)
        puts "Pila vacía"
    else 
        aux = lista_numero[:tope]
        if position == 0
            numero = obtener_numero(lista_numero, position)
            if lista_numero[:tope] == numero && lista_numero[:final] == numero
                lista_numero[:tope] = nil
                lista_numero[:final] = nil
                lista_numero[:size] -= 1
            else 
                nextt = numero[:next]
                lista_numero[:tope] = nextt
                numero[:next] = nil
                lista_numero[:size] -= 1
                auxx = lista_numero[:tope]
                loop do 
                    nexxt = auxx[:next] 
                    if nexxt == nil 
                        auxx[:position] -= 1
                        break
                    end 
                    auxx[:position] -= 1
                    auxx = auxx[:next]
                end 
            end
        elsif position == lista_numero[:size] - 1
            numero = obtener_numero(lista_numero, position)
            numero_anterior = obtener_numero(lista_numero, position - 1)
            lista_numero[:final] = numero_anterior
            numero_anterior[:next] = nil    
            lista_numero[:size] -= 1
        else
            numero = obtener_numero(lista_numero, position)  
            numero_anterior = obtener_numero(lista_numero, position - 1)
            numero_next = obtener_numero(lista_numero, position + 1)    
            numero_anterior[:next] = numero_next
            numero[:next] = nil
            lista_numero[:size] -= 1
            auxx = numero_next 
            loop do 
                nexxt = auxx[:next] 
                if nexxt == nil 
                    auxx[:position] -= 1
                    break
                end 
                auxx[:position] -= 1
                auxx = auxx[:next]
            end 
        end
    end
end

def copiar_numero(copia, n)
    if empty_copia(copia) 
        copia_nodo = {
            numero: n,
            position: 0,
            next: nil
        }
        copia[:tope] = copia_nodo
    else   
        copia_nodo = {
            numero: n,
            position: copia[:size],
            next: nil
        }
        ultimo_nodo = copia[:tope]
        ultimo_nodo[:next] = copia_nodo
        copia[:tope] = copia_nodo
    end
    copia[:size] += 1
end

def copia_lista(copia_lista, num)
    if empty_copia_lista(copia_lista) 
        nuevo_numero = {
            numero: num,
            position: 0,
            next: nil
        }
        copia_lista[:tope] = nuevo_numero
        copia_lista[:final] = nuevo_numero
    else  
        nuevo_numero = {
            numero: num,
            position: copia_lista[:size],
            next: nil
        }
        ultimo_numero = copia_lista[:final]
        ultimo_numero[:next] = nuevo_numero
        copia_lista[:final] = nuevo_numero
    end
    copia_lista[:size] += 1
end

# Copia el número mayor en la pila 
def copiar_numero_mayor(copia_mayor, n)
    if empty_copia_mayor(copia_mayor) 
        copia_nodo = {
            numero: n,
            position: 0,
            next: nil
        }
        copia_mayor[:tope] = copia_nodo
    else   
        copia_nodo = {
            numero: n,
            position: copia_mayor[:size],
            next: nil
        }
        ultimo_nodo = copia_mayor[:tope]
        ultimo_nodo[:next] = copia_nodo
        copia_mayor[:tope] = copia_nodo
    end
    copia_mayor[:size] += 1
end

def mostrar_pila(pila_numero)
    puts "Mostrar números"
    numero = pila_numero[:tope]
    if numero==nil
        puts "No hay números ingresados"
    elsif numero[:next] == nil   
        puts numero[:numero].to_s
    else
        puts numero[:numero].to_s
        begin 
            numero[:numero]
            nuevo_numero =  numero[:next]
            numero = nuevo_numero
            puts nuevo_numero[:numero].to_s
        end while numero[:next] !=  nil  
    end     
end

def mostrar_cola(cola_numero)
    aux = cola_numero[:tope]
    loop do
        nextt = aux[:next]
        puts "Numero: " + aux[:numero].to_s
        puts "position: " + aux[:position].to_s
        if nextt == nil
            break
        end
        aux = aux[:next]
    end
end

def mostrar_lista(lista_numero)
    aux = lista_numero[:tope]
    loop do
        nextt = aux[:next]
        puts "Numero: " + aux[:numero].to_s
        puts "position: " + aux[:position].to_s
        if nextt == nil
            break
        end
        aux = aux[:next]
    end
end

# Muestra el contenido de copia_lista, la cual contiene los números ya ordenados 
def mostrar_copia(copia_lista)
    aux = copia_lista[:tope]
    loop do
        nextt = aux[:next]
        puts "Numero: " + aux[:numero].to_s
        puts "position: " + aux[:position].to_s
        if nextt == nil
            break
        end
        aux = aux[:next]
    end
end

# def ordenar_cola(cola_numero, copia, copia_mayor)
#     if empty_cola(cola_numero)
#         puts "No hay números para ordenar"
#     else
#         aux = cola_numero[:tope]
#         aux2 = {}
#         loop do 
#             nextt = aux[:next]
#             if nextt == nil
#                 break
#             end
#             if aux[:numero] < nextt[:numero]
#                 aux2 = nextt
#             else
#                 aux2 = aux
#             end
#             aux = aux[:next]
#         end 
#         for i in 0..aux[:position]
#             number = cola_numero[:tope]
#             copiar_numero(copia, number)
#             eliminar_de_cola(cola_numero)
#         end
#         num = cola_numero[:tope]
#         copiar_numero_mayor(copia_mayor, num)
#         eliminar_de_cola(cola_numero)
#     end 
# end    

# Ordena la lista, pero no el último elemento. 
def ordenar_lista(lista_numero, copia_lista)
    aux = lista_numero[:tope]
    aux2 = 0
    loop do 
        nexxt = aux[:next] 
        if nexxt == nil 
            break
        else
            if aux[:numero] > nexxt[:numero]
                aux2 = aux
            else 
                aux2 = nexxt
            end
        end 
        aux = aux[:next]
    end
    pos = aux2[:position]
    n = aux2[:numero]
    copia_lista(copia_lista, n)
    eliminar_lista_numero(lista_numero, pos)
end            


puts "Ingresar nuevo número"
for i in 1..5
    n = gets.chomp.to_i
    Agregar_numero_pila(pila_numero, n)
    Agregar_numero_cola(cola_numero, n)
    Agregar_numero_lista(lista_numero, n)
end



eliminar_de_pila(pila_numero, copia)
eliminar_de_cola(cola_numero)

for i in 0..lista_numero.size - 1
    ordenar_lista(lista_numero, copia_lista)
end 

puts '--------'
puts copia_mayor
puts '--------'
mostrar_cola(cola_numero) 
puts '--------'
mostrar_pila(pila_numero)
puts '--------'
mostrar_lista(lista_numero)
puts '--------'
puts '--------'
r = obtener_numero(lista_numero, 3)
puts r[:numero]
puts '--------'
puts '--------'
puts pila_numero
puts '--------'
puts '--------'
puts cola_numero 
puts '--------'
puts '--------'
puts lista_numero
puts '--------'
puts '--------'
puts copia
puts '--------'
puts "Lista Ordenada"
mostrar_copia(copia_lista)





