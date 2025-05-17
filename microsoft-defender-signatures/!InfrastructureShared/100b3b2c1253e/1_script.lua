-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\100b3b2c1253e\1_luac 

-- params : ...
-- function num : 0
local l_0_4 = nil
do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = ((this_sigattrlog[4]).utf8p2):lower(), nil
  else
  end
  if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p2 == nil or not ((this_sigattrlog[5]).utf8p2):lower() then
    return mp.CLEAN
  end
  local l_0_5 = nil
  if not contains(l_0_5, {"regsvr32.*%:?%.?%.?\\", "rundll32.*\\.*"}, false) then
    return mp.CLEAN
  end
  if l_0_5 ~= nil then
    (bm.add_related_string)("proc_cmdline", l_0_5, bm.RelatedStringBMReport)
  end
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  if extractDllForRegproc(l_0_5) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(extractDllForRegproc(l_0_5))) then
    (bm.add_threat_file)((mp.ContextualExpandEnvironmentVariables)(extractDllForRegproc(l_0_5)))
  end
  return mp.INFECTED
end

