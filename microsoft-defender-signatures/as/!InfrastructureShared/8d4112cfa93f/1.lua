-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8d4112cfa93f\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[5]).matched then
  local l_0_0, l_0_1, l_0_2 = nil, nil
  l_0_2 = this_sigattrlog
  l_0_2 = l_0_2[5]
  l_0_1 = l_0_2.utf8p1
  local l_0_3 = nil
end
do
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  -- DECOMPILER ERROR at PC31: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR at PC49: Unhandled construct in 'MakeBoolean' P3

  if (not (MpCommon.GetProcessAttributeValue)(l_0_4, "PFApp_Parent") and (MpCommon.GetProcessAttributeValue)(l_0_4, "inherit:PFApp_Parent")) or not (MpCommon.GetProcessAttributeValue)(l_0_4, "inherit:PFAppTracked") then
    return mp.CLEAN
  end
  local l_0_8, l_0_9 = nil
  -- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R5 in 'AssignReg'

  if not (this_sigattrlog[4]).matched or not nil then
    return mp.CLEAN
  end
  local l_0_10 = "PFApp_Parent"
  if l_0_8 then
    local l_0_11 = nil
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (MpCommon.BmTriggerSig)(l_0_8, "NRI:AppomalyTracked_OutboundHttp", safeJsonSerialize({UserAgent = (nri.GetHttpRequestHeader)("User-Agent") or "", HostName = (string.match)(nil, ".(.*)"), Url = nil, AttributeValue = l_0_11, AttributeName = l_0_10, ProcessName = l_0_9}))
  end
  do
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC99: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

