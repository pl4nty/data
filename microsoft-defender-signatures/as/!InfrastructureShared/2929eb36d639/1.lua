-- Threat: !InfrastructureShared
-- Name: 2929eb36d639
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 8192 < l_0_0 then
  return mp.INFECTED
end
local l_0_1 = mp.GetBruteMatchData()
if not l_0_1.is_header then
  return mp.INFECTED
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
local l_0_3 = string.match(l_0_2, "powershell.exe %-nop %-w hidden %-e ([%w%+/]+=-)")
if l_0_3 == nil then
  return mp.INFECTED
end
mp.vfo_add_buffer(l_0_3, "[PowerShellB64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
mp.set_mpattribute("//SCPT:PowershellNopWHiddenE.Decoded")
return mp.INFECTED
