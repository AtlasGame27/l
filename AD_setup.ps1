Get-ADUser -SearchBase "OU=Accounts,DC=RL,DC=bsc" -Filter * |
Select-Object Name, SamAccountName, Enabled
 
 
 Get-ADGroup -SearchBase "OU=Accounts,DC=RL,DC=bsc" -Filter * |
Sort-Object Name |
Select-Object Name, GroupCategory, GroupScope




$Groups = @(
    "Management-sec",
    "IT Department-sec",
    "Legal Department-sec",
    "Finance Department-sec",
    "HR Department-sec"
)

foreach ($Group in $Groups) {
    Write-Host "`n$Group" -ForegroundColor Yellow
    Get-ADGroupMember -Identity $Group | Select-Object -ExpandProperty Name
}



Get-ADUser -SearchBase "OU=Administrators,DC=RL,DC=bsc" -Filter * |
Select-Object Name, SamAccountName, Enabled


Get-ADGroupMember -Identity "Domain Admins" |
Where-Object {$_.Name -in "DAIldar","DAIgor"} |
Select-Object Name, SamAccountName





 
 
 # ==========================================
# ЧАСТЬ 1: Создание организационных единиц (OU)
# ==========================================

# Корневая организационная единица для учётных записей
New-ADOrganizationalUnit -Name Accounts

# Создание подразделений внутри Accounts
New-ADOrganizationalUnit -Name Management -Path 'OU=Accounts,DC=RL,DC=bsc'
New-ADOrganizationalUnit -Name "IT Department" -Path 'OU=Accounts,DC=RL,DC=bsc'
New-ADOrganizationalUnit -Name "Legal Department" -Path 'OU=Accounts,DC=RL,DC=bsc'
New-ADOrganizationalUnit -Name "Finance Department" -Path 'OU=Accounts,DC=RL,DC=bsc'
New-ADOrganizationalUnit -Name "HR Department" -Path 'OU=Accounts,DC=RL,DC=bsc'

# ==========================================
# ЧАСТЬ 2: Создание пользователей
# ==========================================

# Отдел управления (Management)
New-ADUser -Name "Andrey" -GivenName "Andrey" -UserPrincipalName "Andrey@RL.bsc" -Path 'OU=Management,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString And@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Kirill" -GivenName "Kirill" -UserPrincipalName "Kirill@RL.bsc" -Path 'OU=Management,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Kir@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Maxim" -GivenName "Maxim" -UserPrincipalName "Maxim@RL.bsc" -Path 'OU=Management,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Max@1234567 -AsPlainText -Force) -Enabled $true

# Отдел информационных технологий (IT Department)
New-ADUser -Name "Ildar" -GivenName "Ildar" -UserPrincipalName "Ildar@RL.bsc" -Path 'OU=IT Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Ild@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Igor" -GivenName "Igor" -UserPrincipalName "Igor@RL.bsc" -Path 'OU=IT Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Igo@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Danil" -GivenName "Danil" -UserPrincipalName "Danil@RL.bsc" -Path 'OU=IT Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Dan@1234567 -AsPlainText -Force) -Enabled $true

# Юридический отдел (Legal Department)
New-ADUser -Name "Anton" -GivenName "Anton" -UserPrincipalName "Anton@RL.bsc" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Ant@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Nikolai" -GivenName "Nikolai" -UserPrincipalName "Nikolai@RL.bsc" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Nik@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Muslima" -GivenName "Muslima" -UserPrincipalName "Muslima@RL.bsc" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Mus@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Daria" -GivenName "Daria" -UserPrincipalName "Daria@RL.bsc" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Dar@1234567 -AsPlainText -Force) -Enabled $true

# Финансовый отдел (Finance Department)
New-ADUser -Name "Laysan" -GivenName "Laysan" -UserPrincipalName "Laysan@RL.bsc" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Lay@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Valeria" -GivenName "Valeria" -UserPrincipalName "Valeria@RL.bsc" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Val@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Evgeny" -GivenName "Evgeny" -UserPrincipalName "Evgeny@RL.bsc" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Evg@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Svyatoslav" -GivenName "Svyatoslav" -UserPrincipalName "Svyatoslav@RL.bsc" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Svy@1234567 -AsPlainText -Force) -Enabled $true

# Отдел кадров (HR Department)
New-ADUser -Name "Anna" -GivenName "Anna" -UserPrincipalName "Anna@RL.bsc" -Path 'OU=HR Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Ann@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Natalia" -GivenName "Natalia" -UserPrincipalName "Natalia@RL.bsc" -Path 'OU=HR Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Nat@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "Alexander" -GivenName "Alexander" -UserPrincipalName "Alexander@RL.bsc" -Path 'OU=HR Department,OU=Accounts,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString Ale@1234567 -AsPlainText -Force) -Enabled $true

# ==========================================
# ЧАСТЬ 3: Создание групп и добавление пользователей
# ==========================================

# Группы для отдела управления (Management)
New-ADGroup -Name "Management" -Path 'OU=Management,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Distribution -GroupScope Global -PassThru -Verbose
New-ADGroup -Name "Management-sec" -Path 'OU=Management,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Security -GroupScope Global -PassThru -Verbose
Add-ADGroupMember -Identity "Management" -Members Andrey, Kirill, Maxim
Add-ADGroupMember -Identity "Management-sec" -Members Andrey, Kirill, Maxim

# Группы для отдела информационных технологий (IT Department)
New-ADGroup -Name "IT Department" -Path 'OU=IT Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Distribution -GroupScope Global -PassThru -Verbose
New-ADGroup -Name "IT Department-sec" -Path 'OU=IT Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Security -GroupScope Global -PassThru -Verbose
Add-ADGroupMember -Identity "IT Department" -Members Ildar, Igor, Danil
Add-ADGroupMember -Identity "IT Department-sec" -Members Ildar, Igor, Danil

# Группы для юридического отдела (Legal Department)
New-ADGroup -Name "Legal Department" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Distribution -GroupScope Global -PassThru -Verbose
New-ADGroup -Name "Legal Department-sec" -Path 'OU=Legal Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Security -GroupScope Global -PassThru -Verbose
Add-ADGroupMember -Identity "Legal Department" -Members Anton, Nikolai, Muslima, Daria
Add-ADGroupMember -Identity "Legal Department-sec" -Members Anton, Nikolai, Muslima, Daria

# Группы для финансового отдела (Finance Department)
New-ADGroup -Name "Finance Department" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Distribution -GroupScope Global -PassThru -Verbose
New-ADGroup -Name "Finance Department-sec" -Path 'OU=Finance Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Security -GroupScope Global -PassThru -Verbose
Add-ADGroupMember -Identity "Finance Department" -Members Laysan, Valeria, Evgeny, Svyatoslav
Add-ADGroupMember -Identity "Finance Department-sec" -Members Laysan, Valeria, Evgeny, Svyatoslav

# Группы для отдела кадров (HR Department)
New-ADGroup -Name "HR Department" -Path 'OU=HR Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Distribution -GroupScope Global -PassThru -Verbose
New-ADGroup -Name "HR Department-sec" -Path 'OU=HR Department,OU=Accounts,DC=RL,DC=bsc' -GroupCategory Security -GroupScope Global -PassThru -Verbose
Add-ADGroupMember -Identity "HR Department" -Members Anna, Natalia, Alexander
Add-ADGroupMember -Identity "HR Department-sec" -Members Anna, Natalia, Alexander

# ==========================================
# ЧАСТЬ 4: Создание учётных записей администраторов
# ==========================================

# Организационная единица для администраторов
New-ADOrganizationalUnit -Name Administrators

# Пользователи-администраторы
New-ADUser -Name "DAIldar" -GivenName "DAIldar" -UserPrincipalName "DAIldar@RL.bsc" -Path 'OU=Administrators,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString DAIld@1234567 -AsPlainText -Force) -Enabled $true
New-ADUser -Name "DAIgor" -GivenName "DAIgor" -UserPrincipalName "DAIgor@RL.bsc" -Path 'OU=Administrators,DC=RL,DC=bsc' -AccountPassword (ConvertTo-SecureString DAIgo@1234567 -AsPlainText -Force) -Enabled $true

# Добавление администраторов в группу Domain Admins
Add-ADGroupMember -Identity 'Domain Admins' -Members DAIldar, DAIgor
