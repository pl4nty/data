-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b391597dc0\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p1 ~= "" then
  local l_0_0 = (this_sigattrlog[1]).utf8p1
  local l_0_1 = (bm.get_imagepath)()
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = "BM"
  do
    do
      if (string.find)(l_0_1, "/xattr", -6, true) ~= nil then
        local l_0_3 = (mp.GetParentProcInfo)()
        if l_0_3 ~= nil and l_0_3.ppid ~= nil then
          l_0_2 = l_0_3.ppid
        end
      end
      if l_0_2 == "BM" then
        (bm.trigger_sig)("MacDelQuarantineAttr", l_0_0)
      else
        ;
        (bm.trigger_sig)("MacDelQuarantineAttr", l_0_0, l_0_2)
      end
      TrackPidAndTechniqueBM(l_0_2, "T1553.001", "DefenseEvasion_GateKeeperBypass_xattr")
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

