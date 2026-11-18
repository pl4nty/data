-- Threat: !InfrastructureShared
-- Name: 154789944a164
-- Type: 21

if hstrlog[7].matched then
  mp.changedetectionname(805306431)
elseif hstrlog[8].matched then
  mp.changedetectionname(805306444)
end
return mp.INFECTED
