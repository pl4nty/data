-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAnJsBAtobFingerprintRedir\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  -- DECOMPILER ERROR at PC3: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC4: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R3 in 'AssignReg'

  for l_1_5,l_1_6 in ("([%a_$][%w_$]*)%s*=%s*([%a_$][%w_$]*)%s*!==?%s*[\'\"]%s*[\'\"]%s*%?%s*atob%s*%(%s*([%a_$][%w_$]*)%s*%)%s*:%s*[\'\"]%s*[\'\"]")("([%a_$][%w_$]*)%s*=%s*([%a_$][%w_$]*)%s*!==?%s*[\'\"]%s*[\'\"]%s*%?%s*window%.atob%s*%(%s*([%a_$][%w_$]*)%s*%)%s*:%s*[\'\"]%s*[\'\"]") do
    for l_1_10,l_1_11,l_1_12 in (string.gmatch)(l_1_0, l_1_6) do
      if l_1_10 == l_1_11 and l_1_10 == l_1_12 then
        return true
      end
    end
  end
  return false
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = {}
  -- DECOMPILER ERROR at PC7: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC8: Overwrote pending register: R2 in 'AssignReg'

  do
    local l_2_2 = "getscreeninfo%s*%("
    -- DECOMPILER ERROR at PC9: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC10: Overwrote pending register: R4 in 'AssignReg'

    for l_2_6,l_2_7 in ("getuseragent%s*%(")("deviceorientation") do
      if (string.find)(l_2_0, l_2_7) ~= nil and l_2_2 >= 2 then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

local l_0_2 = function(l_3_0)
  -- function num : 0_2
  do
    local l_3_1 = {}
    -- DECOMPILER ERROR at PC6: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC7: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC8: Overwrote pending register: R3 in 'AssignReg'

    for l_3_5,l_3_6 in ("window%s*%.%s*location%s*=")("window%s*%.%s*location%s*%.%s*href%s*=") do
      if (string.find)(l_3_0, l_3_6) ~= nil then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

do
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if not (function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_0, l_0_1, l_0_2
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = (string.lower)(tostring(l_4_0))
  if l_0_0(l_4_1) and l_0_1(l_4_1) then
    return l_0_2(l_4_1)
  end
end
)(headerpage) and not (function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_0, l_0_1, l_0_2
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = (string.lower)(tostring(l_4_0))
  if l_0_0(l_4_1) and l_0_1(l_4_1) then
    return l_0_2(l_4_1)
  end
end
)(footerpage) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC23: freeLocal<0 in 'ReleaseLocals'

end

