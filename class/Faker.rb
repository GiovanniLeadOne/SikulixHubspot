require 'faker'

def GenerarCompanies(intContador)
    arreglo = []
    index = 0
    while index < intContador
        arreglo.push(Faker::Company.name)
        index = index + 1
    end
    return arreglo
end

def GenerarCompanyDomain(arregloCom)
    index = 0
    arreglo = []
    while index < arregloCom.length
        arreglo.push(arregloCom[index].delete(" ").delete(",")+".org")
        index = index + 1
    end
    return arreglo
end