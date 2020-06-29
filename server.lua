-- Script feito por Erick Alves
-- http://erick.pt
-- http://github.com/erickcouto

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterCommand("loteria",function(source,args)
    
    local maxValue = 10000
	local source = source
	local user_id = vRP.getUserId(source)
	local banco = vRP.getBankMoney(user_id)

        local random = math.random(10);
		bankMoney = vRP.getBankMoney(user_id)
        if parseInt(args[1]) <= maxValue then 
            if banco >= parseInt(args[1]) then
                if args[1] and parseInt(args[1]) > 0 then
                    if (parseInt(random) > 1) then
                        local value = parseInt(args[1])
                        newBankMoney = parseInt(bankMoney + value)
                        vRP.setBankMoney(user_id, newBankMoney)
                        TriggerClientEvent("Notify",source,"sucesso","<b>Parabéns!</b> Você ganhou! <b>R$"..vRP.format(value) .."</b>. Faça bom proveito!")
                    else
                        local value = args[1]
                        newBankMoney = parseInt(bankMoney - value)
                        vRP.setBankMoney(user_id, newBankMoney)
                        TriggerClientEvent("Notify",source,"negado","<b>Não foi desta vez! </b> Você perdeu <b>R$"..vRP.format(args[1]).."</b>. Boa sorte na próxima vez.")
                    end
                else
                    TriggerClientEvent("Notify",source,"importante","<b>Você precisa dizer quanto quer apostar")
                end	
            else
                TriggerClientEvent("Notify",source,"importante","<b>Você não tem dinheiro suficiente no banco para fazer a aposta.")
            end
        else
            TriggerClientEvent("Notify",source,"importante","<b>O valor máximo de apostas é R$"..vRP.format(maxValue))
        end
end)
