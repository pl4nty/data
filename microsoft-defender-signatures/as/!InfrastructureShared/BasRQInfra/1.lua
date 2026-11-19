-- Threat: !InfrastructureShared
-- Name: BasRQInfra
-- Type: 1

function CreateRqNS(l_1_0, l_1_1, l_1_2, l_1_3, l_1_4)
  if l_1_0 == nil or l_1_0 == "" or type(l_1_0) ~= "string" then
    return false
  end
  if l_1_1 == nil or l_1_1 == "" or type(l_1_1) ~= "string" then
    return false
  end
  if l_1_2 == nil or type(l_1_2) ~= "number" then
    l_1_2 = 300
  end
  if l_1_3 == nil or type(l_1_3) ~= "number" then
    l_1_3 = 86400
  end
  if l_1_4 == nil or type(l_1_4) ~= "number" then
    l_1_4 = 1
  end
  local l_1_5 = pcall(MpCommon.RollingQueueCreateNamespaced, l_1_1, l_1_0, l_1_2, l_1_3, l_1_4)
  if not l_1_5 then
    return false
  end
  return true
end

function GetRqValueByKeyNS(l_2_0, l_2_1, l_2_2)
  if l_2_0 == nil or l_2_0 == "" or type(l_2_0) ~= "string" then
    return false
  end
  if l_2_1 == nil or l_2_1 == "" or type(l_2_1) ~= "string" then
    return false
  end
  if l_2_2 == nil or l_2_2 == "" or type(l_2_2) ~= "string" then
    return false
  end
  local l_2_3, l_2_4 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_2_1, l_2_0, l_2_2)
  if not l_2_3 then
    return nil
  end
  if l_2_4 == nil then
    return nil
  end
  return l_2_4.value
end

function AddRqKeyAndValueNS(l_3_0, l_3_1, l_3_2, l_3_3, l_3_4)
  if l_3_0 == nil or l_3_0 == "" or type(l_3_0) ~= "string" then
    return false
  end
  if l_3_1 == nil or l_3_1 == "" or type(l_3_1) ~= "string" then
    return false
  end
  if l_3_2 == nil or l_3_2 == "" or type(l_3_2) ~= "string" then
    return false
  end
  if l_3_3 == nil or l_3_3 == "" or type(l_3_3) ~= "string" then
    return false
  end
  if l_3_4 == nil or type(l_3_4) ~= "number" then
    l_3_4 = 86400
  end
  local l_3_5 = pcall(MpCommon.RollingQueueAppendNamespaced, l_3_1, l_3_0, l_3_2, l_3_3, l_3_4)
  if not l_3_5 then
    return false
  end
  return true
end

function DeleteKeyFromRqNS(l_4_0, l_4_1, l_4_2, l_4_3, l_4_4, l_4_5)
  if l_4_0 == nil or l_4_0 == "" or type(l_4_0) ~= "string" then
    return false
  end
  if l_4_1 == nil or l_4_1 == "" or type(l_4_1) ~= "string" then
    return false
  end
  if l_4_2 == nil or l_4_2 == "" or type(l_4_2) ~= "string" then
    return false
  end
  if l_4_3 == nil or type(l_4_3) ~= "number" then
    l_4_3 = 300
  end
  if l_4_4 == nil or type(l_4_4) ~= "number" then
    l_4_4 = 86400
  end
  if l_4_5 == nil or type(l_4_5) ~= "number" then
    l_4_5 = 1
  end
  local l_4_6, l_4_7 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_4_1, l_4_0)
  if not l_4_6 or l_4_7 == nil then
    return false
  end
  local l_4_8 = pcall(MpCommon.RollingQueueEraseNamespaced, l_4_1, l_4_0)
  if not l_4_8 then
    return false
  end
  local l_4_9 = pcall(MpCommon.RollingQueueCreateNamespaced, l_4_1, l_4_0, l_4_3, l_4_4, l_4_5)
  if not l_4_9 then
    return false
  end
  for l_4_10, l_4_11 in pairs(l_4_7) do
    if l_4_10 ~= l_4_2 then
      local l_4_12 = pcall(MpCommon.RollingQueueAppendNamespaced, l_4_1, l_4_0, l_4_10, l_4_11, l_4_4)
      if not l_4_12 then
        return false
      end
    end
  end
  return true
end

function UpdateRqIntValueByKeyNS(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4, l_5_5, l_5_6)
  if l_5_0 == nil or l_5_0 == "" or type(l_5_0) ~= "string" then
    return false
  end
  if l_5_1 == nil or l_5_1 == "" or type(l_5_1) ~= "string" then
    return false
  end
  if l_5_2 == nil or l_5_2 == "" or type(l_5_2) ~= "string" then
    return false
  end
  if l_5_3 == nil or l_5_3 == "" or type(l_5_3) ~= "number" then
    return nil
  end
  if l_5_4 == nil or type(l_5_4) ~= "number" then
    l_5_4 = 300
  end
  if l_5_5 == nil or type(l_5_5) ~= "number" then
    l_5_5 = 86400
  end
  if l_5_6 == nil or type(l_5_6) ~= "number" then
    l_5_6 = 1
  end
  local l_5_7 = GetRqValueByKeyNS(l_5_0, l_5_1, l_5_2)
  if not l_5_7 then
    if not AddRqKeyAndValueNS(l_5_0, l_5_1, l_5_2, tostring(l_5_3), l_5_5) then
      CreateRqNS(l_5_0, l_5_1, l_5_4, l_5_5, l_5_6)
      AddRqKeyAndValueNS(l_5_0, l_5_1, l_5_2, tostring(l_5_3), l_5_5)
    end
    return l_5_3
  else
    local l_5_8 = (tonumber(l_5_7) or 0) + l_5_3
    if l_5_6 ~= 1 and not DeleteKeyFromRqNS(l_5_0, l_5_1, l_5_2, l_5_4, l_5_5, l_5_6) then
      return nil
    end
    AddRqKeyAndValueNS(l_5_0, l_5_1, l_5_2, tostring(l_5_8), l_5_5)
    return l_5_8
  end
  return nil
end

function UpdateRqStrValueByKeyNS(l_6_0, l_6_1, l_6_2, l_6_3, l_6_4, l_6_5, l_6_6)
  if l_6_0 == nil or l_6_0 == "" or type(l_6_0) ~= "string" then
    return false
  end
  if l_6_1 == nil or l_6_1 == "" or type(l_6_1) ~= "string" then
    return false
  end
  if l_6_2 == nil or l_6_2 == "" or type(l_6_2) ~= "string" then
    return false
  end
  if l_6_3 == nil or l_6_3 == "" or type(l_6_3) ~= "string" then
    return nil
  end
  if l_6_4 == nil or type(l_6_4) ~= "number" then
    l_6_4 = 300
  end
  if l_6_5 == nil or type(l_6_5) ~= "number" then
    l_6_5 = 86400
  end
  if l_6_6 == nil or type(l_6_6) ~= "number" then
    l_6_6 = 1
  end
  local l_6_7 = GetRqValueByKeyNS(l_6_0, l_6_1, l_6_2)
  if not l_6_7 then
    if not AddRqKeyAndValueNS(l_6_0, l_6_1, l_6_2, l_6_3, l_6_5) then
      CreateRqNS(l_6_0, l_6_1, l_6_4, l_6_5, l_6_6)
      AddRqKeyAndValueNS(l_6_0, l_6_1, l_6_2, l_6_3, l_6_5)
    end
    return l_6_3
  else
    if l_6_6 ~= 1 and not DeleteKeyFromRqNS(l_6_0, l_6_1, l_6_2, l_6_4, l_6_5, l_6_6) then
      return nil
    end
    AddRqKeyAndValueNS(l_6_0, l_6_1, l_6_2, l_6_3, l_6_5)
    return l_6_3
  end
  return nil
end
