-- Threat: !InfrastructureShared
-- Name: !#Lua:IsSdbFile
-- Type: 13

if mp.readu_u32(headerpage, 9) == 1717724275 then
  mp.set_mpattribute("Lua:IsSdbFile")
end
return mp.CLEAN
