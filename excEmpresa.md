erDiagram
```mermaid
    DEPARTAMENTO{
        VARCHAR(100) nome
        int numero 
        string empregado_gerente
        int data_inicio
        string localizacao 
    }
    EMPREGADO {
        int numero_cadastro
        string nome
        string sobrenome
        string endereco
        float salario
        string sexo
        int data_nascimento
        string supervisor
    }
    DEPENDENTE{
        string nome 
        int data_nascimento
        string sexo
        string grau_parentesco
    }
    PROJETO{
        string nome
        float horas_trabalhadas_funcionario
        string localizacao
    }

    EMPREGADO }|--|| DEPARTAMENTO : gerenciar
    PROJETO ||--|{ DEPARTAMENTO : gerenciar
    DEPENDENTE }o -- || EMPREGADO : gerenciar
```
    
<img>![image](https://github.com/asuoshig/banco-de-dados/assets/144859297/e6bfe88e-a335-45ed-bfc5-f2be922a38b1)</img>
