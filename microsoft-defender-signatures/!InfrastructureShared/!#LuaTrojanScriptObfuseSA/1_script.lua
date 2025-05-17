-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTrojanScriptObfuseSA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if (mp.get_mpattributesubstring)("PACKED_WITH:") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("ScriptObfuseScore") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("SLFPER:AGGR:PowerShell/EncodedIEX!amsi") then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = (tostring(headerpage)):lower()
l_0_8 = (string.gsub)(l_0_8, "\'%+\'", "")
l_0_8 = (string.gsub)(l_0_8, "\"%+\"", "")
l_0_8 = (string.gsub)(l_0_8, "\'%)%+%(\'", "")
l_0_8 = (string.gsub)(l_0_8, "\"%)%+%(\"", "")
l_0_8 = (string.gsub)(l_0_8, "`", "")
l_0_8 = (string.gsub)(l_0_8, "\"\"", "")
l_0_1 = l_0_2 + l_0_3 + l_0_4 + l_0_5 + l_0_6 + l_0_7
;
(mp.set_mpattributeex)("//ScriptObfuseScore", l_0_1)
if l_0_1 >= 500 then
  (mp.set_mpattribute)("Lua:HighScriptObfuseScore500")
else
  if l_0_1 > 400 then
    (mp.set_mpattribute)("Lua:HighScriptObfuseScore400")
  else
    if l_0_1 >= 300 then
      (mp.set_mpattribute)("Lua:HighScriptObfuseScore300")
    else
      if l_0_1 >= 100 then
        (mp.set_mpattribute)("Lua:HighScriptObfuseScore100")
      else
        if l_0_1 >= 50 then
          (mp.set_mpattribute)("Lua:HighScriptObfuseScore50")
        end
      end
    end
  end
end
;
(mp.vfo_add_buffer)(l_0_8, "[SCRIPTAMSIDecoded]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN

