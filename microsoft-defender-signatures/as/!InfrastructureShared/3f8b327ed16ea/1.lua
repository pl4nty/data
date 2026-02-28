local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "io.memorystream"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
else
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "%-[eE][ncodemaNCODEMA]*%s+"
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L2_1 = NormalizeCmdline
    L3_1 = "powershell"
    L4_1 = L0_1
    L2_1 = L2_1(L3_1, L4_1)
    L1_1 = L2_1
    L2_1 = contains
    L3_1 = L1_1
    L4_1 = "io.memorystream"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L0_1 = L1_1
    end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = {}
L3_1 = "chocolatey"
L4_1 = "Seek(0,0)"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
if L0_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.match
  L6_1 = L0_1
  L5_1 = L0_1.lower
  L5_1 = L5_1(L6_1)
  L6_1 = "%[convert%]%:%:frombase64string%(%'?\"?([a-z0-9/%+=]+)"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
  if L3_1 ~= nil then
    L4_1 = #L3_1
    if L4_1 < 30 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L4_1 = contains
L5_1 = L0_1
L6_1 = "convert]::frombase64string("
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = contains
  L5_1 = L0_1
  L6_1 = "io.streamreader"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = contains
    L5_1 = L0_1
    L6_1 = "io.compression.gzipstream"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = contains
      L5_1 = L0_1
      L6_1 = "::decompress"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = contains
        L5_1 = L0_1
        L6_1 = "readtoend()"
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
