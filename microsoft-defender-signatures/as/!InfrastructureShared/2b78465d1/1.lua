local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.suspicious_image_version
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.suspicious_timestamp
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdll
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.getfilesize
      L0_1 = L0_1()
      if L0_1 < 319488 then
        L0_1 = pesecs
        L0_1 = L0_1[3]
        L0_1 = L0_1.Name
        if L0_1 ~= ".ydata" then
          L0_1 = pesecs
          L0_1 = L0_1[3]
          L0_1 = L0_1.Name
          if L0_1 ~= ".hdata" then
            L0_1 = pesecs
            L0_1 = L0_1[3]
            L0_1 = L0_1.Name
            if L0_1 ~= ".idata" then
              goto lbl_36
            end
          end
        end
        L0_1 = mp
        L0_1 = L0_1.SUSPICIOUS
        return L0_1
      end
    end
  end
end
::lbl_36::
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
