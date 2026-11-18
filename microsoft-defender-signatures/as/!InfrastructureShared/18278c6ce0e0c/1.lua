-- Threat: !InfrastructureShared
-- Name: 18278c6ce0e0c
-- Type: 21

if hstrlog[8].matched then
  mp.changedetectionname(805306421)
elseif hstrlog[10].matched then
  mp.changedetectionname(805306427)
end
return mp.INFECTED
