-- Threat: !InfrastructureShared
-- Name: !#Lua:XslJscriptCdata.A
-- Type: 13
-- MpAttributes: SCRIPT:XslJscriptCdata & BM_XSLJSCRIPT_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 65536 <= l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = string.match(l_0_1, "<!%[CDATA%[(.-)%]%]>%s-</ms.-:script>")
if l_0_2 then
  mp.vfo_add_buffer(l_0_2, "[CdataScript]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
