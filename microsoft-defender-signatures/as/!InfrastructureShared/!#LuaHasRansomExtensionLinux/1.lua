-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaHasRansomExtensionLinux\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("([^/]+)$")
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
if (l_0_1:match("(%.[^%.%s]+)%s*$") == nil and "") or l_0_1:match("(%.[^%.%s]+)%s*$") ~= "" then
  local l_0_4 = nil
  l_0_4 = l_0_4:lower()
  if ({["._locked"] = true, [".akira"] = true, [".avos"] = true, [".avos2"] = true, [".avoslinux"] = true, [".avos2j"] = true, [".ifire"] = true, [".kitty"] = true, [".basta"] = true, [".blackbyte"] = true, [".blacksuit"] = true, [".cerber"] = true, [".cerber2"] = true, [".cerber3"] = true, [".conti"] = true, [".cryptolocker"] = true, [".coaq"] = true, [".cosakos"] = true, [".cuba"] = true, [".cymcrypt"] = true, [".dark_power"] = true, [".devil"] = true, [".dharma"] = true, [".eight"] = false, [".encryptedyourfiles"] = true, [".enigma"] = false, [".everest"] = false, [".fargo"] = true, [".foty"] = true, [".fs0ciety"] = true, [".gatz"] = true, [".gazprom"] = true, [".hack0"] = true, [".itlock3"] = true, [".itlock4"] = true, [".jyos"] = true, [".karma"] = true, [".kigatsu"] = true, [".kitz"] = true, [".l0cked"] = true, [".lockbit"] = true, [".locky"] = true, [".mallox"] = true, [".malox"] = true, [".medusa"] = true, [".met@n"] = true, [".neqp"] = true, [".niwm"] = true, [".nokonoko"] = true, [".nokoyawa"] = true, [".pandora"] = true, [".play"] = true, [".proton"] = true, [".qotr"] = true, [".quantum"] = true, [".ranzylocked"] = true, [".rook"] = true, [".royal"] = true, [".royal_w"] = true, [".royal_u"] = true, [".rsnslocked"] = true, [".shino"] = true, [".thor"] = false, [".tury"] = true, [".venus"] = true, [".v-society"] = true, [".weon"] = true, [".wikon"] = true, [".wncry"] = true, [".wncryt"] = true, [".zatp"] = true, [".zepto"] = true, [".flocked"] = true})[l_0_4] then
    local l_0_5 = nil
    if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
      (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BM_HasRansomExtensionLinux", l_0_0)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

