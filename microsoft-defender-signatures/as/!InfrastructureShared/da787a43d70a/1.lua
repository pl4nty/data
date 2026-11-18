-- Threat: !InfrastructureShared
-- Name: da787a43d70a
-- Type: 21

if peattributes.isexe and hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
