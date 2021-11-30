*** Settings ***
Library        BuiltIn                      # Librairie fournie avec RF (voir https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
Library        test_device.MaClasseTest     # Script de Test test_device.py

*** Variables ***
# Pas de variables pour ces tests #
${PressionTest}     ${54.00}

*** Test Cases ***
Test_Version
    [Documentation]	    Test Unitaire de la version du capteur
    [Tags]		        test_version_logicielle
    ${result} =		    test_device.MaClasseTest.get_version
    Should Be Equal	    ${result}			                    2.1.4

Test_Calibre_Initial
    [Documentation]	    Test Unitaire du calibre initial
    [Tags]		        test_init_calibre
    ${result} =		    test_device.MaClasseTest.get_calibre
    Should Be Equal	    ${result}			                    ${0}

Test_Calibre_OutOfRange
    [Documentation]	    Test Unitaire de la non prise en compte d'un mauvais calibre
    [Tags]		        test_OOF_calibre
    ${result} =		    test_device.MaClasseTest.set_calibre    ${-1}
    Should Be Equal	    ${result}			                    NOK
    ${result} =		    test_device.MaClasseTest.set_calibre    ${21}
    Should Be Equal	    ${result}			                    NOK
    ${result} =		    test_device.MaClasseTest.get_calibre
    Should Be Equal	    ${result}			                    ${0}

Test_des_Calibres
    [Documentation]	    Test Unitaire du Reglage de tout les calibres
    [Tags]		        test_calibres
    FOR                 ${element}  IN RANGE        21
        # Log             ${element}
        ${result} =		test_device.MaClasseTest.set_calibre            ${element}
        Should Be Equal	    ${result}                                   OK
        ${result} =		    test_device.MaClasseTest.get_calibre
        Should Be Equal	    ${result}			                        ${element}
    END
    test_device.MaClasseTest.set_calibre            ${0}

Test_Mesure_Pression
    [Documentation]	    Test Unitaire d'une mesure de pression
    [Tags]		        test_mesure
    ${result} =		    test_device.MaClasseTest.senario_mesure_pression    ${PressionTest}
    Log                 ${PressionTest} -1 <= ${result} <= ${PressionTest} +1
    Should be True      ${PressionTest} -1 <= ${result} <= ${PressionTest} +1

*** Keywords ***
# Pas de KeyWords #