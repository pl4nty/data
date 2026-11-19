-- Threat: !InfrastructureShared
-- Name: 10178bc188f3c
-- Type: 21

if hstrlog[6].matched then
  mp.changedetectionname(805306431)
elseif hstrlog[7].matched then
  mp.changedetectionname(805306444)
end
return mp.INFECTED
