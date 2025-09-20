------------>Project Alpha<--------------
----->https://discord.gg/EKyPk4QbgD<-----

_menuPool = NativeUI.CreatePool()
local adminMenu
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local _lang = Config.Locale or "en"
local L = Locales[_lang]

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()

        if IsControlJustReleased(0, 166) then
            local playerData = ESX.GetPlayerData()
            if playerData.job and playerData.job.name == Config.RequiredJob then
                openMenu()
            end
        end

        Citizen.Wait(1)
    end
end)

function openMenu()
    adminMenu = NativeUI.CreateMenu(Config.Menu.Title, Config.Menu.Subtitle)

    local background = Sprite.New("casinoui_insidetrack", "casinoui_insidetrack", 0, 0, 512, 128) 
    adminMenu:SetBannerSprite(background)

    if Config.Actions.checkIdentity then
        local item = NativeUI.CreateItem(L.checkIdentity.label, L.checkIdentity.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:checkIdentity") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.checkVehicle then
        local item = NativeUI.CreateItem(L.checkVehicle.label, L.checkVehicle.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:checkVehicleOwner") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.createBill then
        local item = NativeUI.CreateItem(L.createBill.label, L.createBill.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:createBilling") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.drag then
        local item = NativeUI.CreateItem(L.drag.label, L.drag.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:drag") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.softHandcuff then
        local item = NativeUI.CreateItem(L.softHandcuff.label, L.softHandcuff.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:softHandcuff") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.hardHandcuff then
        local item = NativeUI.CreateItem(L.hardHandcuff.label, L.hardHandcuff.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:hardHandcuff") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.healBig then
        local item = NativeUI.CreateItem(L.healBig.label, L.healBig.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:healBig") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.healSmall then
        local item = NativeUI.CreateItem(L.healSmall.label, L.healSmall.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:healSmall") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.impoundVehicle then
        local item = NativeUI.CreateItem(L.impoundVehicle.label, L.impoundVehicle.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:impoundVehicle") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.checkLicenses then
        local item = NativeUI.CreateItem(L.checkLicenses.label, L.checkLicenses.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:checkLicenses") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.lockpickCar then
        local item = NativeUI.CreateItem(L.lockpickCar.label, L.lockpickCar.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:lockpickCar") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.putInCar then
        local item = NativeUI.CreateItem(L.putInCar.label, L.putInCar.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:putInCar") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.takeFromCar then
        local item = NativeUI.CreateItem(L.takeFromCar.label, L.takeFromCar.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:takeFromCar") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.repairVehicle then
        local item = NativeUI.CreateItem(L.repairVehicle.label, L.repairVehicle.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:repairVehicle") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.revive then
        local item = NativeUI.CreateItem(L.revive.label, L.revive.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:revive") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.search then
        local item = NativeUI.CreateItem(L.search.label, L.search.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:search") end
        adminMenu:AddItem(item)
    end

    if Config.Actions.washVehicle then
        local item = NativeUI.CreateItem(L.washVehicle.label, L.washVehicle.description)
        item.Activated = function() TriggerEvent("jobs_creator:actions:washVehicle") end
        adminMenu:AddItem(item)
    end

    _menuPool:Add(adminMenu)
    _menuPool:RefreshIndex()
    adminMenu:Visible(true)

    _menuPool:MouseEdgeEnabled(false)
    _menuPool:MouseControlsEnabled(false)
end

function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

print("A FiveM Job Menu Script for Jaksam Jobscreator.")
print("Version: Beta 1.0.0")
print("Autor: Project Alpha - moritzoida")
print("Discord: https://discord.gg/EKyPk4QbgD")