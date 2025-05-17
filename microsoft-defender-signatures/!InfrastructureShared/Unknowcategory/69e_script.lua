-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\69e_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  local l_0_0 = (this_sigattrlog[1]).utf8p1
  local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
  local l_0_2 = (string.lower)((this_sigattrlog[4]).utf8p1)
  local l_0_3 = l_0_2:match("imagename:([^;]+)")
  if not l_0_3 then
    return mp.CLEAN
  end
  if (string.find)(l_0_1, l_0_3) then
    local l_0_4, l_0_5 = (string.match)(l_0_2, "targetprocessppid:(%d+):(%d+)")
    if not l_0_4 or not l_0_5 then
      return mp.CLEAN
    end
    local l_0_6 = (string.format)("pid:%s,ProcessStart:%s", l_0_4, l_0_5)
    ;
    (bm.request_SMS)(l_0_6, "M")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 5000)
    ;
    (bm.trigger_sig)("BMGenericCodeInjector.B", l_0_0, l_0_6)
  end
end
do
  return mp.CLEAN
end

