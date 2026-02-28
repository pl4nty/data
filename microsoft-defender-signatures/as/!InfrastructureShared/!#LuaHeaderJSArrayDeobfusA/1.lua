local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "[%(%)%.%%%+%-%*%?%[%]%^%$]"
  
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = "%"
    L2_3 = A0_3
    L1_3 = L1_3 .. L2_3
    return L1_3
  end
  
  return L1_2(L2_2, L3_2, L4_2)
end

escape_word = L0_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.gsub
L3_1 = "%%"
L4_1 = ">|"
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L1_1
L1_1 = 0
if L0_1 then
  L3_1 = L0_1
  L2_1 = L0_1.gmatch
  L4_1 = "+?(%[%'.-%'%])(%[%d%])+?"
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = nil
    if 95 < L1_1 then
      break
    elseif L6_1 == "[0]" then
      L9_1 = L5_1
      L8_1 = L5_1.match
      L10_1 = "%+?%[('.-'),'.-%]"
      L8_1 = L8_1(L9_1, L10_1)
      L7_1 = L8_1
    elseif L6_1 == "[1]" then
      L9_1 = L5_1
      L8_1 = L5_1.match
      L10_1 = "%+?%[%'.-',('.-').-%]"
      L8_1 = L8_1(L9_1, L10_1)
      L7_1 = L8_1
    elseif L6_1 == "[2]" then
      L9_1 = L5_1
      L8_1 = L5_1.match
      L10_1 = "%+?%[%'.-','.-',('.-').-%]"
      L8_1 = L8_1(L9_1, L10_1)
      L7_1 = L8_1
    elseif L6_1 == "[3]" then
      L9_1 = L5_1
      L8_1 = L5_1.match
      L10_1 = "%+?%[%'.-','.-','.-',('.-').-%]"
      L8_1 = L8_1(L9_1, L10_1)
      L7_1 = L8_1
    elseif L6_1 == "[4]" then
      L9_1 = L5_1
      L8_1 = L5_1.match
      L10_1 = "%+?%[%'.-','.-','.-','.-',('.-').-%]"
      L8_1 = L8_1(L9_1, L10_1)
      L7_1 = L8_1
    end
    if L7_1 then
      L8_1 = string
      L8_1 = L8_1.gsub
      L9_1 = L0_1
      L10_1 = escape_word
      L11_1 = L5_1
      L12_1 = L6_1
      L11_1 = L11_1 .. L12_1
      L10_1 = L10_1(L11_1)
      L11_1 = L7_1
      L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
      _ = L9_1
      L0_1 = L8_1
      L1_1 = L1_1 + 1
    end
  end
end
if 5 <= L1_1 then
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L0_1
  L4_1 = "%'%+%'"
  L5_1 = ""
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
  _ = L3_1
  L0_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L0_1
  L4_1 = "\\x(%x%x)"
  
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2
    L1_2 = string
    L1_2 = L1_2.format
    L2_2 = "%c"
    L3_2 = tonumber
    L4_2 = A0_2
    L5_2 = 16
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
  _ = L3_1
  L0_1 = L2_1
  L3_1 = L0_1
  L2_1 = L0_1.gsub
  L4_1 = ">|"
  L5_1 = "%%"
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
  _ = L3_1
  L0_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L0_1
  L4_1 = "%%(%x%x)"
  
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2
    L1_2 = string
    L1_2 = L1_2.format
    L2_2 = "%c"
    L3_2 = tonumber
    L4_2 = A0_2
    L5_2 = 16
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
  _ = L3_1
  L0_1 = L2_1
  L2_1 = mp
  L2_1 = L2_1.vfo_add_buffer
  L3_1 = L0_1
  L4_1 = "[hdr-jsarr-deobfus]"
  L5_1 = mp
  L5_1 = L5_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
