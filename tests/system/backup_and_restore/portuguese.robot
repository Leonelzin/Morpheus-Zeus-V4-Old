*** Settings ***
Library             OperatingSystem
Library             Browser
Resource            ../../../resources/common.resource
Resource            ../../../resources/pages/system/backup_and_restore.resource

Suite Setup         Run keywords
...                     Setup browser    url=${DUT_LOGIN_WEBPAGE_URL}
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system backup and restore settings page
Test Teardown       Run keyword if test failed
...                     Run keywords
...                     Clear browser storages
...                     AND    Login to DUT    language=portuguese
...                     AND    Access system backup and restore settings page

Force Tags          lang-pt    backup_and_restore    wip


*** Test Cases ***
Factory default settings are correct
    [Tags]    robot:continue-on-failure    smoke
    Page inner title should be "Backup e restauração"
    Page inner subtitle should be "Backup, recuperação e padrão de fábrica"

    Backup section title should be "Realizar backup das configurações"
    Backup section subtitle should be "Crie um arquivo de backup com as configurações atuais do equipamento"
    Backup creation button text should be "CRIAR ARQUIVO DE BACKUP"

    Apply backup section title should be "Aplicar configurações já salvas"
    Apply backup section subtitle should be "Restaurar as configurações salvas a partir de um arquivo de backup"
    Apply backup file input placeholder should be "Carregar arquivo"
    Apply backup send file button text should be "ENVIAR"

    Restore factory default settings section title should be "Restaurar padrão de fábrica"
    Restore factory default settings section subtitle should be "Restaurar as configurações de fábrica do equipamento"
    Restore factory default settings button text should be "RESTAURAR CONFIGURAÇÕES"

    [Teardown]    No operation

Upload backup file
    Create file    ${OUTPUT_DIR}/fake_backup_file.itb
    ${promise}=    Promise to upload file    ${OUTPUT_DIR}/fake_backup_file.itb
    Click    xpath=//*[@id="root"]/div[3]/div/div[2]/div[5]/div/div
    ${upload_result}=    Wait for    ${promise}

Download backup file
    No operation
