-- Threat: !InfrastructureShared
-- Name: !#/Lua:Win32/Prifou!vbs
-- Type: 13

if mp.get_mpattribute("ALFPER:Win32/Prifou!vbs") then
  local l_0_0 = mp.getfilesize()
  if 24576 < l_0_0 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  local l_0_2, l_0_3 = l_0_1:gsub("'.-\n", "")
  if l_0_2 and 100 < l_0_3 then
    mp.vfo_add_buffer(l_0_2, "[Prifou!vbs]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
