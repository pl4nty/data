local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L0_1 = L2_1.utf8p1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L0_1 = L2_1.utf8p1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L0_1 = L2_1.utf8p1
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L1_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.wp2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L1_1 = L2_1.utf8p2
    end
  end
end

function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = string
  L0_2 = L0_2.sub
  L1_2 = L0_1
  L2_2 = 0
  L3_2 = 5
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if L0_2 ~= "/tmp/" then
    L0_2 = string
    L0_2 = L0_2.sub
    L1_2 = L0_1
    L2_2 = 0
    L3_2 = 9
    L0_2 = L0_2(L1_2, L2_2, L3_2)
    if L0_2 ~= "/var/tmp/" then
      L0_2 = string
      L0_2 = L0_2.sub
      L1_2 = L0_1
      L2_2 = 0
      L3_2 = 9
      L0_2 = L0_2(L1_2, L2_2, L3_2)
      if L0_2 ~= "/dev/shm/" then
        goto lbl_33
      end
    end
  end
  L0_2 = isTainted
  L1_2 = L0_1
  L2_2 = "remote_file_created_taint"
  L0_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L0_2 = true
    return L0_2
  end
  ::lbl_33::
  L0_2 = false
  return L0_2
end

checkTaint = L2_1
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "-perm"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "(%s)[-/](0*)200[07]"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.match
      L3_1 = L1_1
      L4_1 = "(%s)-(0*)400[07]"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.match
        L3_1 = L1_1
        L4_1 = "(%s)-(0*)6000"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.match
          L3_1 = L1_1
          L4_1 = "(%s)-(0*)222"
          L2_1 = L2_1(L3_1, L4_1)
          if not L2_1 then
            L2_1 = string
            L2_1 = L2_1.match
            L3_1 = L1_1
            L4_1 = "(%s)-(0*)0002"
            L2_1 = L2_1(L3_1, L4_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "u=s"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "g=s"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L1_1
                  L4_1 = "-o w"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = "-o x"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      goto lbl_147
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L2_1 = checkTaint
    L2_1 = L2_1()
    if L2_1 == true then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  else
    ::lbl_147::
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = " -writable "
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.match
      L3_1 = L1_1
      L4_1 = "(%s)-type%s+[fd]"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "-not -user"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_179
        end
      end
      L2_1 = checkTaint
      L2_1 = L2_1()
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
::lbl_179::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
