-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:CryptoAddressParser
-- Type: 28

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_mpattributesubstring("Detection:Trojan:Win32/ClipBanker")
  or mp.get_mpattributesubstring("Detection:Trojan:Win64/ClipBanker")
  or mp.get_mpattributesubstring("Detection:Trojan:MSIL/ClipBanker") then
  local r0_0 = mp.getfilesize()
  if r0_0 < 768 then
    return mp.CLEAN
  end

  local function r0_1(p1_0)
    local r1_0 = 0
    for r1_1 = #p1_0, 1, -1 do
      r1_0 = r1_0 * 256 + string.byte(p1_0, r1_1, r1_1)
    end
    return r1_0
  end

  mp.readprotection(false)
  local r0_2, r0_3 = 4, 2
  r0_0 = r0_0 < 4096 and r0_0 or 4096
  local r0_4 = mp.readfile(0, r0_0)
  local r0_5 = 60
  local r0_6 = r0_1(string.sub(r0_4, r0_5 + 1, r0_5 + r0_2))
  r0_5 = r0_6 + 6
  local r0_7 = r0_1(string.sub(r0_4, r0_5 + 1, r0_5 + r0_3))
  r0_5 = r0_6 + 20
  local r0_8 = r0_1
  r0_8 = r0_8(string.sub(r0_4, r0_5 + 1, r0_5 + r0_3))
  r0_5 = r0_6 + 24 + r0_8
  local r0_9 = string.sub(r0_4, r0_5 + 1, r0_5 + 40 * r0_7)

  local function r0_10(p2_0)
    local r2_0 = #p2_0
    if r2_0 == 42 and p2_0:find("^0x[0-9a-fA-F]+$") then
      return "eth"
    end
    if r2_0 >= 26 and r2_0 <= 35 and p2_0:find("^[13][a-zA-HJ-NP-Z0-9]+$") then
      return "btc"
    end
    if (r2_0 == 42 or r2_0 == 62) and p2_0:find("^bc1[0-9a-z]+$") then
      return "btc"
    end
    if r2_0 == 42 and p2_0:find("^[qp][0-9a-z]+$") then
      return "bch"
    end
    if (r2_0 == 43 or r2_0 == 63) and p2_0:find("^ltc1[a-z0-9]+$") then
      return "ltc"
    end
    if (r2_0 == 33 or r2_0 == 34) and p2_0:find("^r[1-9a-km-zA-HJ-NP-Z]+$") then
      return "xrp"
    end
    if (r2_0 == 47 or r2_0 == 48) and p2_0:find("^1[1-9a-km-zA-HJ-NP-Z]+$") then
      return "dot"
    end
    if (r2_0 == 58 or r2_0 == 103) and p2_0:find("^addr1[a-zA-Z0-9]+$") then
      return "ada"
    end
    if r2_0 == 59 and p2_0:find("^Ae2[a-zA-Z0-9]+$") then
      return "ada"
    end
    if r2_0 == 104 and p2_0:find("^DdzFF[a-zA-Z0-9]+$") then
      return "ada"
    end
    if r2_0 == 34 then
      if p2_0:find("^T[1-9a-km-zA-HJ-NP-Z]+$") then
        return "trx"
      end
      if p2_0:find("^[LM][1-9a-km-zA-HJ-NP-Z]+$") then
        return "ltc"
      end
      if p2_0:find("^D[5-9A-HJ-NP-U][1-9A-HJ-NP-Za-km-z]+$") then
        return "doge"
      end
    end
    return nil
  end

  local r0_11 = {
    ["'"] = true, ['"'] = true, [">"] = true, ["#"] = true, ["*"] = true, [":"] = true, ["."] = true,
    ["+"] = true, ["="] = true, ["/"] = true, ["<"] = true, [" "] = true, ["\t"] = true,
    ["\n"] = true, ["\r"] = true, ["\000"] = true, ["\001"] = true, ["\002"] = true, ["\011"] = true,
    ["\027"] = true
  }
  local r0_12 = {}
  local r0_13 = 0
  local r0_14 = {}
  local r0_15, r0_16 = 0, 0
  while r0_16 < r0_7 do
    r0_16 = r0_16 + 1
    local r0_17 = string.sub(r0_9, r0_15 + 1, r0_15 + 2 * r0_2)
    if string.sub(r0_17, 1, 6) == ".rdata"
      or string.sub(r0_17, 1, 5) == ".text"
      or string.sub(r0_17, 1, 5) == ".rsrc" then
      r0_5 = r0_15 + 2 * r0_2 + r0_2 + r0_2
      local r0_18 = r0_1(string.sub(r0_9, r0_5 + 1, r0_5 + r0_2))
      r0_5 = r0_5 + r0_2
      local r0_19 = r0_1
      r0_19 = r0_19(string.sub(r0_9, r0_5 + 1, r0_5 + r0_2))
      r0_15 = r0_5 + 40 - 5 * r0_2
      local r0_20 = r0_18 < 10485760 and r0_18 or 10485760
      local r0_21 = mp.readfile(r0_19, r0_20)
      if r0_21 ~= nil and #r0_21 > 25 then
        for r0_22, r0_23, r0_24 in (string.gmatch(r0_21,
          "(%W)([013brTlLMDaAqp]%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w+)(%W)")) do
          if r0_13 > 1000 then
            break
          end
          if r0_11[r0_22] == true and r0_11[r0_24] == true then
            local r0_25 = r0_10(r0_23)
            if r0_25 ~= nil and r0_14[r0_23] == nil then
              r0_14[r0_23] = r0_25
              r0_13 = r0_13 + 1
              local r0_26 = #r0_12 + 1
              local r0_27 = r0_25
              r0_27 = r0_27 .. "=" .. r0_23
              r0_12[r0_26] = r0_27
            end
          end
        end
      end
    else
      r0_15 = r0_15 + 40
    end
  end
  if r0_13 > 0 then
    r0_12[#r0_12 + 1] = "threat=ClipBanker,filetype=PE"
    local r0_28 = "MpInternal_researchdata="
    local r0_29 = table.concat(r0_12, ",")
    r0_28 = r0_28 .. r0_29
    r0_29 = mp
    r0_29 = r0_29.set_mpattribute
    r0_29(r0_28)
    r0_29 = mp
    r0_29 = r0_29.CLEAN
    return r0_29
  end
end
return mp.CLEAN
