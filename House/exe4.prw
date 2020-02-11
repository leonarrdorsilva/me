#include 'protheus.ch'

User Function Loop1()

nValor1 := 0
nSoma:= 0

nValor1:= Val(FWInputBox("Digite um valor para a soma"))

while nValor1 <> 0 

nSoma := nSoma + nValor1

alert("Total " +cValtoChar(nSoma))
nValor1:= Val(FWInputBox("Digite um valor para a soma"))

enddo 

alert("Resultado " + cValtoChar(nSoma))

return

