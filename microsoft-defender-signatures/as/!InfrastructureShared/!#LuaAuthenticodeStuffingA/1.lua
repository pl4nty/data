-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAuthenticodeStuffingA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) or l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = (pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_SECURITY]
if isnull(l_0_1) or isnull(l_0_1.Size) then
  return mp.CLEAN
end
local l_0_2 = l_0_1.Size
if l_0_2 < 65536 then
  return mp.CLEAN
end
local l_0_5 = l_0_0 < l_0_2
do
  local l_0_6 = (mp.get_mpattributevalue)("RPF:SuspiciousDigitalSignatureSize")
  if (isnull(l_0_6) or l_0_6 < 65536 or l_0_0 > l_0_6 * 4 or not l_0_5) and not true then
    return mp.CLEAN
  end
  set_research_data("certstuff_filesize", tostring(l_0_0), false)
  set_research_data("certstuff_certsize", tostring(l_0_2), false)
  if not isnull(l_0_6) then
    set_research_data("certstuff_excess", tostring(l_0_6), false)
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

