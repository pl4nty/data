-- Threat: !InfrastructureShared
-- Name: !#Lua:JSInContainerWithMotw.A
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile & Lua:JSExt & MpOnOpenOrCloseRtpScan

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:ContainerHasMotw.A", true)
if l_0_0 == 0 and l_0_1 then
  if mp.get_mpattribute("//LuaZipWithSingleJS") then
    mp.set_mpattribute("Lua:SingleJSInContainerWithMotw.B")
  end
  return mp.INFECTED
end
return mp.CLEAN
