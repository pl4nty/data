-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\847_513.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0 = nil
    l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
    if not (string.find)(l_0_0, "wget", 1, true) and not (string.find)(l_0_0, "curl", 1, true) and not (string.find)(l_0_0, "invoke-webrequest", 1, true) then
      return mp.CLEAN
    end
  end
  ;
  (bm.trigger_sig_self_propagate)("SuspMMCExec.C", "INFECTED")
  return mp.INFECTED
end

