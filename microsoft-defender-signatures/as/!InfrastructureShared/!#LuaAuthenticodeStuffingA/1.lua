-- Threat: !InfrastructureShared
-- Name: !#Lua:AuthenticodeStuffing.A
-- Type: 10
-- Includes: ResearchData, BMLuaLib
-- MpAttributes: PEPCODE:HasDigitalSignature & RPF:SuspiciousDigitalSignatureSize

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) or l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY]
if isnull(l_0_1) or isnull(l_0_1.Size) then
  return mp.CLEAN
end
local l_0_2 = l_0_1.Size
if l_0_2 < 65536 then
  return mp.CLEAN
end
local l_0_4 = l_0_0 < l_0_2
local l_0_5 = mp.get_mpattributevalue("RPF:SuspiciousDigitalSignatureSize")
local l_0_6 = false
if not isnull(l_0_5) and 65536 <= l_0_5 and l_0_0 <= l_0_5 * 4 then
  l_0_6 = true
end
if not l_0_4 and not l_0_6 then
  return mp.CLEAN
end
set_research_data("certstuff_filesize", tostring(l_0_0), false)
set_research_data("certstuff_certsize", tostring(l_0_2), false)
if not isnull(l_0_5) then
  set_research_data("certstuff_excess", tostring(l_0_5), false)
end
return mp.INFECTED
