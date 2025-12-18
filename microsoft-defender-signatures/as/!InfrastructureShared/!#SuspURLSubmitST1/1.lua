-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SuspURLSubmitST1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
if headerpage == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(tostring(headerpage))
if l_0_1 ~= nil then
  for l_0_5 in (string.gmatch)(l_0_1, "domain: ?\'(https?://[A-Za-z0-9]+.com)\',") do
    if l_0_5 ~= nil and not l_0_0[l_0_5] then
      (mp.set_mpattribute)((string.format)("MpInternal_researchdata=SuspURL=%s", l_0_5))
      l_0_0[l_0_5] = true
    end
    do break end
  end
end
do
  if l_0_0 == nil or #l_0_0 == 0 then
    return mp.CLEAN
  end
  local l_0_6 = {}
  l_0_6.SIG_CONTEXT = "LUA_GENERIC"
  l_0_6.CONTENT_SOURCE = "Obfus_JS"
  l_0_6.PROCESS_CONTEXT = "Node_JS"
  l_0_6.PARENT_CONTEXT = nil
  l_0_6.FILELESS = "false"
  l_0_6.CMDLINE_URL = "false"
  l_0_6.BREAK_AT_FIRST_HIT_MALWARE = "60"
  l_0_6.BREAK_AT_FIRST_HIT_PHISH = "60"
  l_0_6.script_zone = ""
  l_0_6.script_motw = ""
  l_0_6.script_path = ""
  local l_0_7 = CheckUrlReputationSimple(l_0_0, l_0_6, 60)
  if l_0_7 then
    (mp.set_mpattribute)("Lua:SuspNodeJS.BadDomain.ST1")
  end
  return mp.CLEAN
end

