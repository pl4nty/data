-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb329340340\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
  local l_0_0 = (this_sigattrlog[2]).utf8p1
  local l_0_1 = (bm.get_imagepath)()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
    return mp.CLEAN
  end
  ;
  (bm.trigger_sig)("MacDelQuarantineAttr", l_0_0)
  do
    do
      if (string.find)(l_0_1, "/xattr", -6, true) ~= nil then
        local l_0_2 = (mp.GetParentProcInfo)()
        if l_0_2 ~= nil and l_0_2.ppid ~= nil then
          (bm.trigger_sig)("MacDelQuarantineAttr", l_0_0, l_0_2.ppid)
        end
      end
      TrackPidAndTechniqueBM("BM", "T1553.001", "DefenseEvasion_GateKeeperBypass_xattr")
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

