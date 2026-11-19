-- Threat: !InfrastructureShared
-- Name: !#Lua:AutorunLd
-- Type: 10

if mp.GetResmgrBasePlugin() == "AutorunInf" then
  return mp.INFECTED
end
return mp.CLEAN
