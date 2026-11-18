-- Threat: !InfrastructureShared
-- Name: AgePrevalence
-- Type: 1

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function getAgePrev(p1_0)
  local r1_0, r1_1 = -1, -1
  local r1_2 = mp.get_mpattributevalue("Lua:FmsAgeInDays")
  local r1_3 = mp.get_mpattributevalue("Lua:FmsPrevalence")
  p1_0 = p1_0 ~= nil and p1_0 == true and p1_0
  local r1_4, r1_5
  if p1_0 == false then
    if r1_2 ~= nil and r1_3 ~= nil and r1_2 > -1 and r1_3 > -1 then
      local r1_6 = r1_3
      return r1_2, r1_6
    end
    local r1_7 = MpCommon.GetPersistContext(mp.getfilename())
    if r1_7 == nil then
      r1_4 = nil
      r1_5 = nil
    else
      local r1_8, r1_9, r1_10 = ipairs(r1_7)
      r1_4 = nil
      r1_5 = nil
      for r1_11, r1_12 in r1_8, r1_9, r1_10 do
        local r1_13 = tonumber(string.match(r1_12, "^Age:([0-9]+)$"))
        r1_4 = r1_13
        if r1_4 ~= nil and r1_0 < r1_4 then
          r1_0 = r1_4
        end
        r1_13 = tonumber
        r1_13 = r1_13(string.match(r1_12, "^Prevalence:([0-9]+)$"))
        r1_5 = r1_13
        if r1_5 ~= nil and r1_1 < r1_5 then
          r1_1 = r1_5
        end
      end
    end
    if r1_0 > -1 and r1_1 > -1 then
      setAgePrev(r1_0, r1_1)
      local r1_14 = r1_0
      local r1_15 = r1_1
      return r1_14, r1_15
    end
  else
    r1_4 = nil
    r1_5 = nil
  end
  local r1_16 = mp.enum_mpattributesubstring("PreAgent:")
  if r1_16 and #r1_16 > 0 then
    local r1_17, r1_18, r1_19 = ipairs(r1_16)
    for r1_20, r1_21 in r1_17, r1_18, r1_19 do
      local r1_22, r1_23 = string.match(r1_21, "PreAgent:V(%d+)V(%d+)$")
      if r1_22 then
        r1_4 = tonumber(r1_22)
      end
      if r1_4 then
        r1_4 = r1_4 - 362514
      end
      if r1_0 < r1_4 then
        r1_0 = r1_4
      end
      if r1_23 then
        r1_5 = tonumber(r1_23)
      end
      if r1_5 then
        r1_5 = r1_5 - 362514
      end
      if r1_1 < r1_5 then
        r1_1 = r1_5
      end
    end
  end
  if r1_2 == nil or r1_3 == nil then
    setAgePrev(r1_0, r1_1)
  end
  local r1_24 = r1_0
  local r1_25 = r1_1
  return r1_24, r1_25
end

function setAgePrev(p2_0, p2_1)
  if type(p2_0) == "number" and type(p2_1) == "number" then
    if p2_0 > -1 and p2_1 > -1 then
      mp.set_mpattributeex("Lua:FmsAgeInDays", p2_0)
      mp.set_mpattributeex("Lua:FmsPrevalence", p2_1)
      local r2_0 = "Age:" .. tostring(p2_0)
      local r2_1 = "Prevalence:" .. tostring(p2_1)
      local r2_2 = mp.getfilename()
      if MpCommon.GetPersistContextCount(r2_2) == 0 then
        local r2_3 = {}
        table.insert(r2_3, r2_0)
        table.insert(r2_3, r2_1)
        MpCommon.SetPersistContext(r2_2, r2_3, 0)
      else
        if not MpCommon.QueryPersistContext(r2_2, r2_0) then
          MpCommon.AppendPersistContext(r2_2, r2_0, 0)
        end
        if not MpCommon.QueryPersistContext(r2_2, r2_1) then
          MpCommon.AppendPersistContext(r2_2, r2_1, 0)
        end
      end
      if p2_0 == 0 then
        mp.set_mpattribute("BM_AgeEquals0")
      elseif p2_0 == 1 then
        mp.set_mpattribute("BM_AgeEquals1")
      elseif p2_0 == 2 then
        mp.set_mpattribute("BM_AgeEquals2")
      elseif p2_0 == 3 then
        mp.set_mpattribute("BM_AgeEquals3")
      elseif p2_0 == 4 then
        mp.set_mpattribute("BM_AgeEquals4")
      elseif p2_0 == 5 then
        mp.set_mpattribute("BM_AgeEquals5")
      elseif p2_0 == 6 then
        mp.set_mpattribute("BM_AgeEquals6")
      elseif p2_0 == 7 then
        mp.set_mpattribute("BM_AgeEquals7")
      elseif p2_0 <= 15 then
        mp.set_mpattribute("BM_AgeUpTo15")
      elseif p2_0 <= 30 then
        mp.set_mpattribute("BM_AgeUpTo30")
      elseif p2_0 <= 90 then
        mp.set_mpattribute("BM_AgeUpTo90")
      elseif p2_0 <= 180 then
        mp.set_mpattribute("BM_AgeUpTo180")
      elseif p2_0 <= 360 then
        mp.set_mpattribute("BM_AgeUpTo360")
      end
      if p2_1 == 0 then
        mp.set_mpattribute("BM_PrevalenceEquals0")
      elseif p2_1 <= 10 then
        mp.set_mpattribute("BM_PrevalenceUpTo10")
      elseif p2_1 <= 20 then
        mp.set_mpattribute("BM_PrevalenceUpTo20")
      elseif p2_1 <= 50 then
        mp.set_mpattribute("BM_PrevalenceUpTo50")
      elseif p2_1 <= 100 then
        mp.set_mpattribute("BM_PrevalenceUpTo100")
      elseif p2_1 <= 500 then
        mp.set_mpattribute("BM_PrevalenceUpTo500")
      elseif p2_1 <= 1000 then
        mp.set_mpattribute("BM_PrevalenceUpTo1000")
      elseif p2_1 <= 5000 then
        mp.set_mpattribute("BM_PrevalenceUpTo5000")
      elseif p2_1 <= 10000 then
        mp.set_mpattribute("BM_PrevalenceUpTo10000")
      elseif p2_1 <= 50000 then
        mp.set_mpattribute("BM_PrevalenceUpTo50000")
      elseif p2_1 <= 100000 then
        mp.set_mpattribute("BM_PrevalenceUpTo100000")
      end
      return true
    end
    return false
  end
  return false
end

function clearPersistContext(p3_0, p3_1)
  if p3_0 ~= nil and p3_0 ~= "" and p3_1 ~= nil and p3_1 ~= "" then
    if MpCommon.GetPersistContextCount(p3_0) == 0 then
      return true
    end
    local r3_0 = {}
    local r3_1 = false
    local r3_2 = MpCommon.GetPersistContext(p3_0)
    if r3_2 ~= nil then
      for r3_3, r3_4 in ipairs(r3_2) do
        if r3_4 == p3_1 then
          r3_1 = true
        else
          table.insert(r3_0, r3_4)
        end
      end
    end
    if r3_1 == true then
      MpCommon.SetPersistContext(p3_0, r3_0, 0)
    end
    return r3_1
  end
  return false
end

function clearPersistContextNoPath(p4_0, p4_1)
  if p4_0 ~= nil and p4_0 ~= "" and p4_1 ~= nil and p4_1 ~= "" then
    if MpCommon.GetPersistContextCountNoPath(p4_0) == 0 then
      return true
    end
    local r4_0 = {}
    local r4_1 = false
    local r4_2 = MpCommon.GetPersistContextNoPath(p4_0)
    if r4_2 ~= nil then
      for r4_3, r4_4 in ipairs(r4_2) do
        if r4_4 == p4_1 then
          r4_1 = true
        else
          table.insert(r4_0, r4_4)
        end
      end
    end
    if r4_1 == true then
      MpCommon.SetPersistContextNoPath(p4_0, r4_0, 0)
    end
    return r4_1
  end
  return false
end
