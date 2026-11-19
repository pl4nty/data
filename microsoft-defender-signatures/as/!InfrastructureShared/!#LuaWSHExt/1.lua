-- Threat: !InfrastructureShared
-- Name: !#Lua:WSHExt
-- Type: 12

if mp.get_mpattribute("Lua:JSExt") or mp.get_mpattribute("Lua:VBSExt") or mp.get_mpattribute("Lua:WSFExt") then
  mp.UfsSetMetadataBool("Lua:WSHExt", true)
  return mp.INFECTED
else
  local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:WSHExt", true)
  if l_0_0 == 0 and l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
