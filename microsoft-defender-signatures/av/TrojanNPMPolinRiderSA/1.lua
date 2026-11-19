-- Threat: Trojan:NPM/PolinRider.SA
-- Type: 13
-- MpAttributes: (Implicit:FileExtEQ.woff2 | Implicit:FileExtEQ.woff)

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.enum_mpattributesubstring("SCPT:PolinRider")
if r0_0 ~= nil and #r0_0 >= 4 then
  return mp.INFECTED
end
local r0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if r0_1 ~= nil and string.sub(r0_1, -6) == ".woff2" then
  local r0_2 = mp.getfilesize()
  if r0_2 ~= nil and not (r0_2 < 4) then
    local r0_3 = mp.readheader(0, 4)
    if r0_3 ~= nil and tostring(r0_3) ~= "wOF2" then
      local r0_4 = r0_2
      r0_4 = r0_4 > 65536 and 65536 or r0_4
      mp.readprotection(false)
      local r0_5 = mp.readfile(0, r0_4)
      mp.readprotection(true)
      if r0_5 == nil then
        return mp.CLEAN
      end
      local r0_6 = tostring(r0_5)
      if #r0_6 == r0_4 then
        r0_6 = string.lower(string.gsub(r0_6, "%s+", ""))
        local r0_7 = string.find
        r0_7 = r0_7(r0_6, "global%.i=['\"]a%d") ~= nil
        local r0_8 = string.find(r0_6, "global%[['\"]r['\"]%]=require;")
        r0_8 = r0_8 ~= nil or string.find(r0_6, "global%.r=require;") ~= nil
        local r0_9 = string
        local r0_10 = r0_9.find
        r0_10 = r0_10(r0_6, "['\"]sec%-v['\"]:[%w_$]+%[['\"]_v['\"]%]") ~= nil
        if r0_7 and r0_8 and r0_10 then
          if string.find(r0_6, "%f[%w_$]eval%(")
            and string.find(r0_6, "%f[%w_$]spawn%(")
            and string.find(r0_6, "windowshide", 1, true) then
            return mp.INFECTED
          end
          return mp.CLEAN
        end
        return mp.CLEAN
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
