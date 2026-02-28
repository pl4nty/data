local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L4_1 = bm
L4_1 = L4_1.GetProcedureMatchDuration
L5_1 = 0
L4_1 = L4_1(L5_1)
L5_1 = bm
L5_1 = L5_1.GetProcedureMatchDuration
L6_1 = 1
L5_1 = L5_1(L6_1)
if L4_1 > L5_1 then
  L1_1 = L4_1 - L5_1
else
  L1_1 = L5_1 - L4_1
end
if 20000000 < L1_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = this_sigattrlog
L6_1 = L6_1[13]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[13]
  L0_1 = L6_1.utf8p1
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[14]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[14]
    L0_1 = L6_1.utf8p1
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[15]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[15]
      L0_1 = L6_1.utf8p1
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[16]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[16]
        L0_1 = L6_1.utf8p1
      else
        L6_1 = this_sigattrlog
        L6_1 = L6_1[18]
        L6_1 = L6_1.matched
        if L6_1 then
          L6_1 = this_sigattrlog
          L6_1 = L6_1[18]
          L0_1 = L6_1.utf8p1
        else
          L6_1 = this_sigattrlog
          L6_1 = L6_1[17]
          L6_1 = L6_1.matched
          if L6_1 then
            L6_1 = this_sigattrlog
            L6_1 = L6_1[17]
            L0_1 = L6_1.utf8p1
          else
            L6_1 = this_sigattrlog
            L6_1 = L6_1[19]
            L6_1 = L6_1.matched
            if L6_1 then
              L6_1 = this_sigattrlog
              L6_1 = L6_1[19]
              L0_1 = L6_1.utf8p1
            end
          end
        end
      end
    end
  end
end
L6_1 = string
L6_1 = L6_1.match
L7_1 = L0_1
L8_1 = "^/home/"
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = string
  L6_1 = L6_1.match
  L7_1 = L0_1
  L8_1 = "^/root/"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.match
    L7_1 = L0_1
    L8_1 = "^/tmp/"
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.match
      L7_1 = L0_1
      L8_1 = "^/var/"
      L6_1 = L6_1(L7_1, L8_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.match
        L7_1 = L0_1
        L8_1 = "^/dev/shm/"
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.match
          L7_1 = L0_1
          L8_1 = "^/srv/ftp/"
          L6_1 = L6_1(L7_1, L8_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.match
            L7_1 = L0_1
            L8_1 = "^/mnt/"
            L6_1 = L6_1(L7_1, L8_1)
            if not L6_1 then
              goto lbl_279
            end
          end
        end
      end
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[1]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[1]
  L2_1 = L6_1.utf8p2
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[2]
    L2_1 = L6_1.utf8p2
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[3]
      L2_1 = L6_1.utf8p2
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[4]
        L2_1 = L6_1.utf8p2
      end
    end
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[5]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[5]
  L2_1 = L6_1.utf8p2
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[6]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[6]
    L2_1 = L6_1.utf8p2
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[7]
      L2_1 = L6_1.utf8p2
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[8]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = this_sigattrlog
        L6_1 = L6_1[8]
        L2_1 = L6_1.utf8p2
      else
        L6_1 = this_sigattrlog
        L6_1 = L6_1[9]
        L6_1 = L6_1.matched
        if L6_1 then
          L6_1 = this_sigattrlog
          L6_1 = L6_1[9]
          L2_1 = L6_1.utf8p2
        else
          L6_1 = this_sigattrlog
          L6_1 = L6_1[10]
          L6_1 = L6_1.matched
          if L6_1 then
            L6_1 = this_sigattrlog
            L6_1 = L6_1[10]
            L2_1 = L6_1.utf8p2
          else
            L6_1 = this_sigattrlog
            L6_1 = L6_1[11]
            L6_1 = L6_1.matched
            if L6_1 then
              L6_1 = this_sigattrlog
              L6_1 = L6_1[11]
              L2_1 = L6_1.utf8p2
            else
              L6_1 = this_sigattrlog
              L6_1 = L6_1[12]
              L6_1 = L6_1.matched
              if L6_1 then
                L6_1 = this_sigattrlog
                L6_1 = L6_1[12]
                L2_1 = L6_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = "([%./%w%s_]+%.%w+)"
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L4_2 = L2_2
    L3_2 = L2_2.gsub
    L5_2 = "^(sudo%s+)"
    L6_2 = ""
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2 = L3_2
    L4_2 = L2_2
    L3_2 = L2_2.gsub
    L5_2 = "^(%w+%s+)"
    L6_2 = ""
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2 = L3_2
  end
  return L2_2
end

extract_script_file = L6_1
if L2_1 ~= nil and L2_1 ~= "" then
  L6_1 = extract_script_file
  L7_1 = L2_1
  L6_1 = L6_1(L7_1)
  L3_1 = L6_1
else
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.reverse
  L1_2 = L1_2(L2_2)
  L3_2 = L1_2
  L2_2 = L1_2.match
  L4_2 = "([^/]+)"
  L2_2 = L2_2(L3_2, L4_2)
  L4_2 = L2_2
  L3_2 = L2_2.reverse
  return L3_2(L4_2)
end

get_basename = L6_1
if L3_1 ~= nil and L3_1 ~= "" then
  L6_1 = get_basename
  L7_1 = L0_1
  L6_1 = L6_1(L7_1)
  L7_1 = get_basename
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  if L6_1 ~= L7_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
else
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.trigger_sig
L7_1 = "TestExecutionFromScriptInSuspLocation"
L8_1 = L0_1
L6_1(L7_1, L8_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_279::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
