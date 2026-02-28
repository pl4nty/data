local L0_1, L1_1, L2_1, L3_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 or A0_2 == "" then
    L1_2 = false
    return L1_2
  end
  L1_2 = sysio
  L1_2 = L1_2.EnumerateServices
  L1_2 = L1_2()
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L3_2 = A0_2
  L2_2 = A0_2.lower
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.ServiceName
    if L7_2 then
      L9_2 = L7_2
      L8_2 = L7_2.lower
      L8_2 = L8_2(L9_2)
      if A0_2 == L8_2 then
        return L6_2
      end
    end
  end
end

getService = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = {}
  L2_2 = nil
  L3_2 = 8
  L4_2 = 1
  L5_2 = {}
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L13_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L6_2 = 0
  L7_2 = string
  L7_2 = L7_2.len
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if L7_2 < 2 or 39 < L7_2 then
    L8_2 = nil
    return L8_2
  end
  L8_2 = L7_2
  L9_2 = 1
  L10_2 = -1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = string
    L12_2 = L12_2.sub
    L13_2 = A0_2
    L14_2 = L11_2
    L15_2 = L11_2
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    if L12_2 == ":" then
      L3_2 = L3_2 - 1
      if L3_2 < 1 then
        L13_2 = nil
        return L13_2
      end
      if L2_2 == ":" then
        L6_2 = L3_2
      end
      L4_2 = 1
    else
      if 65536 <= L4_2 then
        L13_2 = nil
        return L13_2
      end
      L13_2 = L7_2 - 1
      if L11_2 == L13_2 and L2_2 == ":" then
        L13_2 = nil
        return L13_2
      end
      L13_2 = tonumber
      L14_2 = L12_2
      L15_2 = 16
      L13_2 = L13_2(L14_2, L15_2)
      L12_2 = L13_2
      if not L12_2 then
        L13_2 = nil
        return L13_2
      end
      L13_2 = L5_2[L3_2]
      L14_2 = L12_2 * L4_2
      L13_2 = L13_2 + L14_2
      L5_2[L3_2] = L13_2
      L4_2 = L4_2 * 16
    end
    L2_2 = L12_2
  end
  if L3_2 ~= 1 then
    L8_2 = L3_2
    L9_2 = L6_2
    L10_2 = 1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = L11_2 - L3_2
      L12_2 = L12_2 + 1
      L13_2 = L5_2[L11_2]
      L5_2[L12_2] = L13_2
      L5_2[L11_2] = 0
    end
  end
  if 6 < L3_2 then
    L8_2 = nil
    return L8_2
  end
  L8_2 = 0
  L9_2 = 1
  L10_2 = 0
  L11_2 = nil
  L12_2 = 1
  L13_2 = 8
  L14_2 = 1
  for L15_2 = L12_2, L13_2, L14_2 do
    L16_2 = L5_2[L15_2]
    if L16_2 == 0 then
      L8_2 = L8_2 + 1
      if L8_2 == 1 then
        L9_2 = L15_2
      end
      if L10_2 < L8_2 then
        L10_2 = L8_2
        L11_2 = L9_2
      end
    else
      L8_2 = 0
    end
    L17_2 = string
    L17_2 = L17_2.format
    L18_2 = "%x"
    L19_2 = L16_2
    L17_2 = L17_2(L18_2, L19_2)
    L5_2[L15_2] = L17_2
  end
  L12_2 = 0
  L13_2 = 1
  L14_2 = 8
  L15_2 = 1
  for L16_2 = L13_2, L14_2, L15_2 do
    if not (L16_2 < L11_2) then
      L17_2 = L11_2 + L10_2
      if not (L16_2 >= L17_2) then
        goto lbl_138
      end
    end
    L17_2 = #L1_2
    L17_2 = L17_2 + 1
    L18_2 = L5_2[L16_2]
    L1_2[L17_2] = L18_2
    L12_2 = 0
    ::lbl_138::
    if L12_2 < 2 and L16_2 < 8 then
      L17_2 = #L1_2
      L17_2 = L17_2 + 1
      L1_2[L17_2] = ":"
      L12_2 = L12_2 + 1
    end
  end
  L13_2 = table
  L13_2 = L13_2.concat
  L14_2 = L1_2
  L15_2 = ""
  return L13_2(L14_2, L15_2)
end

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A0_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.len
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 < 16 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = nil
  L5_2 = nil
  L6_2 = 1
  L7_2 = L3_2
  L8_2 = 2
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = string
    L10_2 = L10_2.byte
    L11_2 = A0_2
    L12_2 = L9_2
    L13_2 = L9_2 + 3
    L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2)
    L5_2 = L11_2
    L4_2 = L10_2
    if not L4_2 or not L5_2 then
      L10_2 = nil
      return L10_2
    end
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L11_2 = string
    L11_2 = L11_2.format
    L12_2 = "%02x%02x"
    L13_2 = L4_2
    L14_2 = L5_2
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    L2_2[L10_2] = L11_2
    L10_2 = #L2_2
    if L10_2 == 8 then
      L10_2 = table
      L10_2 = L10_2.concat
      L11_2 = L2_2
      L12_2 = ":"
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = L0_1
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L10_2 = L11_2
      if L10_2 then
        L11_2 = #A1_2
        L11_2 = L11_2 + 1
        A1_2[L11_2] = L10_2
      end
      L11_2 = {}
      L2_2 = L11_2
    end
  end
end

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = {}
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = sysio
    L2_2 = L2_2.GetRegValueAsString
    L3_2 = L1_2
    L4_2 = "NameServer"
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = split
    L4_2 = L2_2
    L5_2 = ","
    L6_2 = L0_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L0_2 = L3_2
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsString
    L4_2 = L1_2
    L5_2 = "DhcpNameServer"
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
    L3_2 = split
    L4_2 = L2_2
    L5_2 = " "
    L6_2 = L0_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L0_2 = L3_2
  end
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  if L1_2 then
    L2_2 = sysio
    L2_2 = L2_2.GetRegValueAsString
    L3_2 = L1_2
    L4_2 = "NameServer"
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = split
    L4_2 = L2_2
    L5_2 = ","
    L6_2 = L0_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L0_2 = L3_2
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsBinary
    L4_2 = L1_2
    L5_2 = "Dhcpv6DNSServers"
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
    L3_2 = L1_1
    L4_2 = L2_2
    L5_2 = L0_2
    L3_2(L4_2, L5_2)
  end
  L2_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces"
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumKeys
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = pairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = sysio
        L10_2 = L10_2.RegOpenKey
        L11_2 = string
        L11_2 = L11_2.format
        L12_2 = "%s\\%s"
        L13_2 = L2_2
        L14_2 = L9_2
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        if L10_2 then
          L11_2 = sysio
          L11_2 = L11_2.GetRegValueAsString
          L12_2 = L10_2
          L13_2 = "NameServer"
          L11_2 = L11_2(L12_2, L13_2)
          L12_2 = split
          L13_2 = L11_2
          L14_2 = ","
          L15_2 = L0_2
          L12_2 = L12_2(L13_2, L14_2, L15_2)
          L0_2 = L12_2
          L12_2 = sysio
          L12_2 = L12_2.GetRegValueAsString
          L13_2 = L10_2
          L14_2 = "DhcpNameServer"
          L12_2 = L12_2(L13_2, L14_2)
          L11_2 = L12_2
          L12_2 = split
          L13_2 = L11_2
          L14_2 = " "
          L15_2 = L0_2
          L12_2 = L12_2(L13_2, L14_2, L15_2)
          L0_2 = L12_2
        end
      end
    end
  end
  L2_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters\\Interfaces"
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumKeys
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = pairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = sysio
        L10_2 = L10_2.RegOpenKey
        L11_2 = string
        L11_2 = L11_2.format
        L12_2 = "%s\\%s"
        L13_2 = L2_2
        L14_2 = L9_2
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        if L10_2 then
          L11_2 = sysio
          L11_2 = L11_2.GetRegValueAsString
          L12_2 = L10_2
          L13_2 = "NameServer"
          L11_2 = L11_2(L12_2, L13_2)
          if L11_2 then
            L12_2 = {}
            L13_2 = split
            L14_2 = L11_2
            L15_2 = ","
            L16_2 = L12_2
            L13_2(L14_2, L15_2, L16_2)
            L13_2 = ipairs
            L14_2 = L12_2
            L13_2, L14_2, L15_2 = L13_2(L14_2)
            for L16_2, L17_2 in L13_2, L14_2, L15_2 do
              L18_2 = L0_1
              L19_2 = L17_2
              L18_2 = L18_2(L19_2)
              L17_2 = L18_2
              if L17_2 then
                L18_2 = #L0_2
                L18_2 = L18_2 + 1
                L0_2[L18_2] = L17_2
              end
            end
          end
          L12_2 = sysio
          L12_2 = L12_2.GetRegValueAsString
          L13_2 = L10_2
          L14_2 = "Dhcpv6DNSServers"
          L12_2 = L12_2(L13_2, L14_2)
          L11_2 = L12_2
          L12_2 = L1_1
          L13_2 = L11_2
          L14_2 = L0_2
          L12_2(L13_2, L14_2)
        end
      end
    end
  end
  L4_2 = GetRollingQueueKeyValues
  L5_2 = "rq_dnsServer"
  L6_2 = "dnsServers"
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= nil then
    L5_2 = #L4_2
    if 0 < L5_2 then
      L5_2 = ipairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = AppendToRollingQueue
        L11_2 = "rq_dnsServer"
        L12_2 = "lastDnsServers"
        L13_2 = L9_2.value
        L14_2 = 86400
        L15_2 = 100
        L16_2 = 0
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      end
    end
  end
  L5_2 = AppendToMultiValueRollingQueue
  L6_2 = "rq_dnsServer"
  L7_2 = "dnsServers"
  L8_2 = L0_2
  L9_2 = 86400
  L10_2 = 100
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  return L0_2
end

updateSystemDNSServers = L2_1

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = false
  L3_2 = false
  L4_2 = false
  L5_2 = false
  L6_2 = IsKeyValuePairInRollingQueue
  L7_2 = "rq_dnsServer"
  L8_2 = "dnsServers"
  L9_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L7_2 = GetRollingQueueCountForKey
    L8_2 = "rq_dnsServer"
    L9_2 = "dnsServers"
    L7_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      L7_2 = 0
    end
    if 0 == L7_2 then
      L8_2 = updateSystemDNSServers
      L8_2 = L8_2()
      L9_2 = 0
      L10_2 = pairs
      L11_2 = L8_2
      L10_2, L11_2, L12_2 = L10_2(L11_2)
      for L13_2, L14_2 in L10_2, L11_2, L12_2 do
        if L14_2 == A0_2 then
          L9_2 = 1
        end
      end
      L10_2 = #L8_2
      if 0 < L10_2 and L9_2 == 0 then
        L2_2 = true
      end
    else
      L2_2 = true
    end
  end
  if L2_2 then
    L7_2 = IsKeyValuePairInRollingQueue
    L8_2 = "rq_dnsServer"
    L9_2 = "lastDnsServers"
    L10_2 = A0_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 then
      L2_2 = false
      L3_2 = true
    elseif A1_2 then
      L7_2 = updateSystemDNSServers
      L7_2()
      L7_2 = isAlternateDNSServer
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      L2_2 = L7_2
      if not L2_2 then
        L4_2 = true
      end
    end
  end
  L7_2 = L2_2
  L8_2 = L3_2
  L9_2 = L4_2
  return L7_2, L8_2, L9_2
end

isAlternateDNSServer = L2_1

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = #A0_2
  if not L1_2 then
    L2_2 = 0
    return L2_2
  end
  L2_2 = 0
  L3_2 = 0
  L4_2 = {}
  L5_2 = 0
  L6_2 = 1
  L7_2 = L1_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L11_2 = A0_2
    L10_2 = A0_2.byte
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    L5_2 = L5_2 + L10_2
    L11_2 = L4_2[L10_2]
    if L11_2 ~= nil then
      L11_2 = L4_2[L10_2]
      L11_2 = L11_2 + 1
      L4_2[L10_2] = L11_2
    else
      L4_2[L10_2] = 1
    end
  end
  L5_2 = L5_2 / L1_2
  L6_2 = pairs
  L7_2 = L4_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = math_pow
    L12_2 = math_abs
    L13_2 = L5_2 - L9_2
    L12_2 = L12_2(L13_2)
    L13_2 = 2
    L11_2 = L11_2(L12_2, L13_2)
    L11_2 = L10_2 * L11_2
    L3_2 = L3_2 + L11_2
    L11_2 = L10_2 / L1_2
    L12_2 = math_log2
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    L12_2 = L11_2 * L12_2
    L2_2 = L2_2 - L12_2
  end
  L3_2 = L3_2 / L1_2
  L6_2 = L2_2
  L7_2 = L3_2
  return L6_2, L7_2
end

getEntropyAndVariance = L2_1

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = "aAeEiIoOuUyYwWbBcCdDfFgGHjJkKlLmMnNpPqQrRsStT"
  L3_2 = L1_2
  L2_2 = L1_2.find
  L4_2 = string
  L4_2 = L4_2.char
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 == nil then
    L3_2 = 0
    if L3_2 then
      goto lbl_21
    end
  end
  if 14 < L2_2 then
    L3_2 = 2
    if L3_2 then
      goto lbl_21
    end
  end
  L3_2 = 1
  ::lbl_21::
  return L3_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = 0
  L2_2 = 0
  L3_2 = 0
  L4_2 = #A0_2
  if L4_2 < 5 then
    L4_2 = L1_2
    L5_2 = 1
    L6_2 = L2_2
    L7_2 = L3_2
    return L4_2, L5_2, L6_2, L7_2
  end
  L4_2 = nil
  L5_2 = nil
  L6_2 = 1
  L7_2 = 2
  L8_2 = #A0_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L12_2 = A0_2
    L11_2 = A0_2.byte
    L13_2 = L10_2
    L11_2 = L11_2(L12_2, L13_2)
    L4_2 = L11_2
    L12_2 = A0_2
    L11_2 = A0_2.byte
    L13_2 = L10_2 - 1
    L11_2 = L11_2(L12_2, L13_2)
    L5_2 = L11_2
    L11_2 = 47 < L4_2 and L4_2 < 58
    L12_2 = 47 < L5_2 and L5_2 < 58
    if L11_2 ~= L12_2 then
      L3_2 = L3_2 + 1
    end
    if 64 < L4_2 and L4_2 < 91 and 96 < L5_2 and L5_2 < 123 or 64 < L5_2 and L5_2 < 91 and 96 < L4_2 and L4_2 < 123 then
      L2_2 = L2_2 + 1
    end
    L11_2 = L2_1
    L12_2 = L4_2
    L11_2 = L11_2(L12_2)
    L12_2 = L2_1
    L13_2 = L5_2
    L12_2 = L12_2(L13_2)
    if L11_2 == L12_2 then
      L1_2 = L1_2 + L6_2
      L6_2 = L6_2 + 1
    else
      L6_2 = 1
    end
  end
  L7_2 = L1_2
  L8_2 = #A0_2
  L8_2 = L1_2 / L8_2
  L9_2 = L2_2
  L10_2 = L3_2
  return L7_2, L8_2, L9_2, L10_2
end

computeStringScores = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = bm
  L4_2 = L4_2.get_imagepath
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L4_2 = bm
  L4_2 = L4_2.get_current_process_startup_info
  L4_2 = L4_2()
  L5_2 = L4_2.command_line
  L6_2 = MpCommon
  L6_2 = L6_2.GetPersistContextNoPath
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L7_2 = ipairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = bm
      L12_2 = L12_2.add_related_string
      L13_2 = A1_2
      L14_2 = L11_2
      L15_2 = bm
      L15_2 = L15_2.RelatedStringBMReport
      L12_2(L13_2, L14_2, L15_2)
    end
  end
end

reportPersistedContext = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L3_2 = MpCommon
  L3_2 = L3_2.GetPersistContextNoPath
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  L5_2 = nil
  if L3_2 then
    L6_2 = #L3_2
    if 0 < L6_2 then
      L6_2 = ipairs
      L7_2 = L3_2
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      for L9_2, L10_2 in L6_2, L7_2, L8_2 do
        if L10_2 then
          L11_2 = string
          L11_2 = L11_2.format
          L12_2 = "BM_%s_%s"
          L13_2 = A0_2
          L14_2 = L10_2
          L11_2 = L11_2(L12_2, L13_2, L14_2)
          L12_2 = MpCommon
          L12_2 = L12_2.GetPersistContextCountNoPath
          L13_2 = L11_2
          L12_2 = L12_2(L13_2)
          if 0 == L12_2 then
            L13_2 = bm
            L13_2 = L13_2.add_related_string
            L14_2 = "bmurl"
            L15_2 = L10_2
            L16_2 = bm
            L16_2 = L16_2.RelatedStringBMReport
            L13_2(L14_2, L15_2, L16_2)
            L13_2 = string
            L13_2 = L13_2.find
            L14_2 = L10_2
            L15_2 = "_"
            L16_2 = 1
            L17_2 = true
            L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
            L14_2 = string
            L14_2 = L14_2.sub
            L15_2 = L10_2
            L16_2 = 1
            L17_2 = L13_2 - 1
            L14_2 = L14_2(L15_2, L16_2, L17_2)
            if A2_2 or L14_2 == "dns-exfil.net" then
              L15_2 = MpCommon
              L15_2 = L15_2.AddDnsBlockListDomain
              L16_2 = L14_2
              L17_2 = 600
              L15_2, L16_2 = L15_2(L16_2, L17_2)
              L5_2 = L16_2
              L4_2 = L15_2
            end
            L15_2 = MpCommon
            L15_2 = L15_2.GetPersistContextNoPath
            L16_2 = L10_2
            L15_2 = L15_2(L16_2)
            if L15_2 then
              L16_2 = ipairs
              L17_2 = L15_2
              L16_2, L17_2, L18_2 = L16_2(L17_2)
              for L19_2, L20_2 in L16_2, L17_2, L18_2 do
                L21_2 = bm
                L21_2 = L21_2.add_related_string
                L22_2 = "bmurl"
                L23_2 = L20_2
                L24_2 = "."
                L25_2 = L14_2
                L23_2 = L23_2 .. L24_2 .. L25_2
                L24_2 = bm
                L24_2 = L24_2.RelatedStringBMReport
                L21_2(L22_2, L23_2, L24_2)
              end
              L16_2 = MpCommon
              L16_2 = L16_2.AppendPersistContextNoPath
              L17_2 = L11_2
              L18_2 = "1"
              L19_2 = 600
              L16_2(L17_2, L18_2, L19_2)
            end
            L16_2 = L14_2
            L17_2 = L4_2
            L18_2 = L5_2
            return L16_2, L17_2, L18_2
          end
        end
      end
    end
  end
end

reportAndSinkholeDNSTelemetry = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = false
  L3_2 = nil
  L4_2 = nil
  L5_2 = #A0_2
  L6_2 = A1_2
  repeat
    A1_2 = A1_2 + 1
    L7_2 = A0_2[1]
    L8_2 = L7_2
    L7_2 = L7_2.byte
    L9_2 = A0_2[1]
    L9_2 = #L9_2
    L9_2 = L9_2 - A1_2
    L7_2 = L7_2(L8_2, L9_2)
    L4_2 = L7_2
    if L4_2 == 46 then
      L6_2 = A1_2
    end
    L7_2 = 2
    L8_2 = L5_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = A0_2[L10_2]
      L11_2 = #L11_2
      if not (A1_2 > L11_2) then
        L11_2 = A0_2[L10_2]
        L12_2 = L11_2
        L11_2 = L11_2.byte
        L13_2 = A0_2[L10_2]
        L13_2 = #L13_2
        L13_2 = L13_2 - A1_2
        L11_2 = L11_2(L12_2, L13_2)
        if L11_2 == L4_2 then
          goto lbl_34
        end
      end
      L2_2 = true
      do break end
      ::lbl_34::
    end
  until L2_2
  A1_2 = A1_2 - 1
  L7_2 = string
  L7_2 = L7_2.sub
  L8_2 = A0_2[1]
  L9_2 = A0_2[1]
  L9_2 = #L9_2
  L9_2 = L9_2 - A1_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L6_2
  L9_2 = L7_2
  return L8_2, L9_2
end

extractCommonSuffix = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = 0
  L3_2 = {}
  L4_2 = A0_2[1]
  L4_2 = #L4_2
  L4_2 = L4_2 - A1_2
  L5_2 = 0
  L6_2 = ipairs
  L7_2 = A0_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L3_2
    L13_2 = string
    L13_2 = L13_2.sub
    L14_2 = L10_2
    L15_2 = 0
    L16_2 = #L10_2
    L16_2 = L16_2 - A1_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2, L15_2, L16_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = #L10_2
    L11_2 = L2_2 + L11_2
    L2_2 = L11_2 - A1_2
  end
  L6_2 = L2_2
  L7_2 = L4_2
  L8_2 = L3_2
  return L6_2, L7_2, L8_2
end

computeDataLength = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L5_2 = 0
  L6_2 = {}
  L7_2 = {}
  L8_2 = #A0_2
  L9_2 = #A1_2
  if L8_2 ~= L9_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = ipairs
  L9_2 = A1_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
    L13_2 = split
    L14_2 = L12_2
    L15_2 = "_"
    L13_2 = L13_2(L14_2, L15_2)
    L12_2 = L13_2
    L13_2 = tonumber
    L14_2 = L12_2[1]
    L13_2 = L13_2(L14_2)
    L14_2 = tonumber
    L15_2 = L12_2[2]
    L14_2 = L14_2(L15_2)
    L15_2 = A0_2[L11_2]
    L15_2 = #L15_2
    if L14_2 == L15_2 then
      L6_2[L11_2] = L13_2
    else
      break
    end
    L4_2 = L4_2 + L14_2
    L15_2 = tonumber
    L16_2 = L12_2[3]
    L15_2 = L15_2(L16_2)
    L5_2 = L5_2 + L15_2
    if L2_2 > L13_2 or L2_2 == 0 then
      L2_2 = L13_2
    end
    if L3_2 < L13_2 then
      L3_2 = L13_2
    end
    if 1 < L11_2 then
      L15_2 = L11_2 - 1
      L16_2 = L6_2[L11_2]
      L17_2 = L11_2 - 1
      L17_2 = L6_2[L17_2]
      L16_2 = L16_2 - L17_2
      L7_2[L15_2] = L16_2
    end
  end
  L8_2 = L6_2
  L9_2 = L4_2
  L10_2 = L5_2
  L11_2 = L3_2 - L2_2
  L12_2 = L2_2
  L13_2 = L3_2
  return L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
end

getTimingData = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = 0
  L3_2 = string
  L3_2 = L3_2.find
  L4_2 = A0_2
  L5_2 = "svchost.exe"
  L6_2 = 1
  L7_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if L3_2 then
    L3_2 = mp
    L3_2 = L3_2.bitor
    L4_2 = L2_2
    L5_2 = 1
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
  end
  L3_2 = versioning
  L3_2 = L3_2.GetCloudBlockLevel
  L3_2 = L3_2()
  if 3 < L3_2 then
    L3_2 = mp
    L3_2 = L3_2.bitor
    L4_2 = L2_2
    L5_2 = 2
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
  end
  L3_2 = {}
  L3_2[0] = "Telemetry"
  L3_2[1] = "SystemResolver"
  L3_2[2] = "CloudBlock"
  L3_2[3] = "CBSsystemResolver"
  L4_2 = 4 * A1_2
  L4_2 = 805306720 + L4_2
  L4_2 = L4_2 + L2_2
  L5_2 = L4_2
  L6_2 = L3_2[L2_2]
  return L5_2, L6_2
end

routeBasedOnProcess = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = nri
  L1_2 = L1_2.GetRawResponseBlob
  L1_2 = L1_2()
  if not L1_2 then
    L2_2 = mp
    L2_2 = L2_2.CLEAN
    return L2_2
  end
  L2_2 = #L1_2
  L3_2 = 0
  L4_2 = 13
  L5_2 = 20
  while A0_2 > L3_2 and L3_2 < L5_2 and L2_2 >= L4_2 do
    L6_2 = mp
    L6_2 = L6_2.bitand
    L7_2 = string
    L7_2 = L7_2.byte
    L8_2 = L1_2
    L9_2 = L4_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 192
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 == 192 then
      L4_2 = L4_2 + 6
    else
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = L1_2
      L8_2 = "\000"
      L9_2 = L4_2
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 then
        L4_2 = L6_2 + 5
      end
    end
    L3_2 = L3_2 + 1
  end
  L2_2 = L2_2 - L4_2
  return L2_2
end

computeReponseLength = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = ""
  L4_2 = {}
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  if A1_2 == nil or 5 < A1_2 then
    A1_2 = 5
  end
  if A1_2 == 0 then
    return L4_2
  end
  if A0_2 ~= nil then
    L8_2 = pcall
    L9_2 = bm
    L9_2 = L9_2.get_process_relationships
    L10_2 = A0_2
    L8_2, L9_2 = L8_2(L9_2, L10_2)
    L6_2 = L9_2
    L5_2 = L8_2
  else
    L8_2 = bm
    L8_2 = L8_2.get_current_process_startup_info
    L8_2 = L8_2()
    L7_2 = L8_2
    L8_2 = pcall
    L9_2 = bm
    L9_2 = L9_2.get_process_relationships
    L10_2 = L7_2.ppid
    L8_2, L9_2 = L8_2(L9_2, L10_2)
    L6_2 = L9_2
    L5_2 = L8_2
  end
  if not L5_2 then
    return L4_2
  end
  if L6_2 == nil then
    return L4_2
  end
  if A2_2 == nil then
    A2_2 = 1
  end
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
    L13_2 = mp
    L13_2 = L13_2.bitand
    L14_2 = L12_2.reason_ex
    L15_2 = A2_2
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 == A2_2 then
      L14_2 = L12_2.ppid
      if L14_2 ~= nil then
        L14_2 = L12_2.cmd_line
        if L14_2 then
          L14_2 = pcall
          L15_2 = bm_AddRelatedFileFromCommandLine
          L16_2 = L12_2.cmd_line
          L14_2(L15_2, L16_2)
        end
        L14_2 = bm
        L14_2 = L14_2.add_related_process
        L15_2 = L12_2.ppid
        L14_2(L15_2)
        L14_2 = add_parents
        L15_2 = L12_2.ppid
        L16_2 = A1_2 - 1
        L17_2 = A2_2
        L14_2 = L14_2(L15_2, L16_2, L17_2)
        L4_2 = L14_2
        L14_2 = table
        L14_2 = L14_2.insert
        L15_2 = L4_2
        L16_2 = L12_2
        L14_2(L15_2, L16_2)
      end
    end
  end
  if A0_2 == nil then
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L4_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  return L4_2
end

add_parents = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 ~= nil then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "table" then
      L1_2 = bm
      L1_2 = L1_2.get_process_relationships
      L1_2, L2_2 = L1_2()
      L3_2 = ipairs
      L4_2 = L1_2
      L3_2, L4_2, L5_2 = L3_2(L4_2)
      for L6_2, L7_2 in L3_2, L4_2, L5_2 do
        L8_2 = L7_2.image_path
        if L8_2 ~= nil then
          L8_2 = L7_2.image_path
          L9_2 = L8_2
          L8_2 = L8_2.match
          L10_2 = "\\([^\\]+)$"
          L8_2 = L8_2(L9_2, L10_2)
          L9_2 = A0_2[L8_2]
          if not L9_2 then
            L9_2 = string
            L9_2 = L9_2.lower
            L10_2 = L8_2
            L9_2 = L9_2(L10_2)
            L9_2 = A0_2[L9_2]
            if not L9_2 then
              goto lbl_34
            end
          end
          L9_2 = true
          return L9_2
        end
        ::lbl_34::
      end
    end
  end
  L1_2 = false
  return L1_2
end

is_excluded_parent_proc = L3_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = {}
  L0_2["ccmexec.exe"] = true
  L0_2["gpscript.exe"] = true
  L0_2["mpcmdrun.exe"] = true
  L0_2["mssense.exe"] = true
  L0_2["senseir.exe"] = true
  L1_2 = is_excluded_parent_proc
  L2_2 = L0_2
  return L1_2(L2_2)
end

is_excluded_parent_proc_auto = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = add_parents
  L0_2 = L0_2()
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = MpCommon
    L7_2 = L7_2.IsFriendlyProcess
    L8_2 = L6_2.ppid
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L8_2 = bm
      L8_2 = L8_2.request_SMS
      L9_2 = L6_2.ppid
      L10_2 = "H"
      L8_2(L9_2, L10_2)
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = L6_2
      L8_2(L9_2, L10_2)
    end
  end
  L2_2 = #L1_2
  L2_2 = 0 < L2_2
  L3_2 = L1_2
  return L2_2, L3_2
end

sms_untrusted_process = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = add_parents
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = MpCommon
    L8_2 = L8_2.IsFriendlyProcess
    L9_2 = L7_2.ppid
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L9_2 = bm
      L9_2 = L9_2.request_SMS
      L10_2 = L7_2.ppid
      L11_2 = "H"
      L9_2(L10_2, L11_2)
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L2_2
      L11_2 = L7_2
      L9_2(L10_2, L11_2)
    end
  end
  L3_2 = #L2_2
  L3_2 = 0 < L3_2
  L4_2 = L2_2
  return L3_2, L4_2
end

sms_untrusted_process_pid = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 or not A1_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.StringRegExpSearch
  L3_2 = A1_2
  L4_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = {}
  while L2_2 do
    L5_2 = table
    L5_2 = L5_2.insert
    L6_2 = L4_2
    L7_2 = L3_2
    L5_2(L6_2, L7_2)
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = A0_2
    L7_2 = L3_2
    L8_2 = 1
    L9_2 = true
    L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L7_2 = string
    L7_2 = L7_2.sub
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    A0_2 = L7_2
    L7_2 = MpCommon
    L7_2 = L7_2.StringRegExpSearch
    L8_2 = A1_2
    L9_2 = A0_2
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    L3_2 = L8_2
    L2_2 = L7_2
  end
  return L4_2
end

multi_match_regex = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 == nil then
    return
  end
  L1_2 = pcall
  L2_2 = mp
  L2_2 = L2_2.ContextualExpandEnvironmentVariables
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    A0_2 = L2_2
  end
  L3_2 = sysio
  L3_2 = L3_2.IsFileExists
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = sysio
  L3_2 = L3_2.GetFileSize
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if 50000 < L3_2 then
    return
  end
  L4_2 = bm
  L4_2 = L4_2.add_related_file
  L5_2 = A0_2
  L4_2(L5_2)
  L4_2 = "(?:---BEGIN ID---|Company Key: )(?:\\x0d\\x0a| )?([A-Za-z0-9+/=]*)(?:\\x0d\\x0a| |<)"
  L5_2 = "(\\b[A-Za-z0-9]{76}\\b)"
  L6_2 = "(\\b([13]{1}[a-km-zA-HJ-NP-Z1-9]{26,33}|bc1[a-z0-9]{39,59}|((bitcoincash|bchreg|bchtest):)?[qp][a-z0-9]{41}|[48][0-9AB][1-9A-HJ-NP-Za-km-z]{93}|0x[a-fA-F0-9]{40})\\b)"
  L7_2 = "((?i)(?:[\\\\A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[A-Za-z0-9-]*[A-Za-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\]))"
  L8_2 = "((?i)(?:http|ftp|https):\\/\\/(?:[\\w_-]+(?:(?:\\.[\\w_-]+)+))(?:[\\w.,@?^=%&:\\/~+#-]*[\\w@?^=%&\\/~+#-])?|([a-zA-Z2-7]{1,56}\\.onion)(?:[\\w.,@?^=%&:\\/~+#-]*[\\w@?^=%&\\/~+#-])?)"
  L9_2 = nil
  L10_2 = sysio
  L10_2 = L10_2.ReadFile
  L11_2 = A0_2
  L12_2 = 0
  L13_2 = L3_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L9_2 = L10_2
  
  function L10_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L2_3 = A0_3
    if A1_3 == "emails" then
      L3_3 = 1
      while true do
        L4_3 = #L2_3
        if not (L3_3 <= L4_3) then
          break
        end
        L4_3 = string
        L4_3 = L4_3.match
        L5_3 = L2_3[L3_3]
        L6_3 = "\\"
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = table
          L4_3 = L4_3.remove
          L5_3 = L2_3
          L6_3 = L3_3
          L4_3(L5_3, L6_3)
        else
          L3_3 = L3_3 + 1
        end
      end
    end
    if A1_3 == "urls" then
      L3_3 = ipairs
      L4_3 = L2_3
      L3_3, L4_3, L5_3 = L3_3(L4_3)
      for L6_3, L7_3 in L3_3, L4_3, L5_3 do
        L8_3 = L2_3[L6_3]
        L9_3 = L8_3
        L8_3 = L8_3.sub
        L10_3 = -1
        L11_3 = -1
        L8_3 = L8_3(L9_3, L10_3, L11_3)
        if L8_3 == "/" then
          L8_3 = L2_3[L6_3]
          L9_3 = L8_3
          L8_3 = L8_3.sub
          L10_3 = 1
          L11_3 = -2
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L2_3[L6_3] = L8_3
        end
      end
    end
    return L2_3
  end
  
  clean = L10_2
  L10_2 = {}
  L11_2 = table_dedup
  L12_2 = multi_match_regex
  L13_2 = L9_2
  L14_2 = L6_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L10_2.wallets = L11_2
  L11_2 = table_dedup
  L12_2 = clean
  L13_2 = multi_match_regex
  L14_2 = L9_2
  L15_2 = L7_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = "emails"
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L10_2.emails = L11_2
  L11_2 = table_dedup
  L12_2 = clean
  L13_2 = multi_match_regex
  L14_2 = L9_2
  L15_2 = L8_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = "urls"
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L10_2.urls = L11_2
  L11_2 = table_dedup
  L12_2 = multi_match_regex
  L13_2 = L9_2
  L14_2 = L5_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L10_2.tox_ids = L11_2
  L11_2 = table_dedup
  L12_2 = multi_match_regex
  L13_2 = L9_2
  L14_2 = L4_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L10_2.victim_ids = L11_2
  L11_2 = safeJsonSerialize
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  L12_2 = MpCommon
  L12_2 = L12_2.Base64Encode
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L11_2 = L12_2
  L12_2 = bm
  L12_2 = L12_2.trigger_sig
  L13_2 = "RansomNoteContent"
  L14_2 = A0_2
  L12_2(L13_2, L14_2)
  L12_2 = bm
  L12_2 = L12_2.add_related_string
  L13_2 = "RansomNoteContent"
  L14_2 = L11_2
  L15_2 = bm
  L15_2 = L15_2.RelatedStringBMReport
  L12_2(L13_2, L14_2, L15_2)
  L12_2 = bm
  L12_2 = L12_2.add_related_string
  L13_2 = "RansomNoteContentLength"
  L14_2 = tostring
  L15_2 = #L11_2
  L14_2 = L14_2(L15_2)
  L15_2 = bm
  L15_2 = L15_2.RelatedStringBMReport
  L12_2(L13_2, L14_2, L15_2)
  L12_2 = true
  return L12_2
end

extractRansomNote = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  if not A0_2 then
    L2_2 = {}
    L3_2 = "User-Agent"
    L2_2[1] = L3_2
    A0_2 = L2_2
  else
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "string" then
      L2_2 = {}
      L3_2 = A0_2
      L2_2[1] = L3_2
      A0_2 = L2_2
    end
  end
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.gsub
    L9_2 = L6_2
    L8_2 = L6_2.lower
    L8_2 = L8_2(L9_2)
    L9_2 = "-"
    L10_2 = ""
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = nri
    L8_2 = L8_2.GetHttpRequestHeader
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L1_2[L7_2] = L8_2
  end
  L2_2 = nri
  L2_2 = L2_2.GetURI
  L2_2 = L2_2()
  if L2_2 then
    L1_2.uri = L2_2
  end
  L3_2 = nri
  L3_2 = L3_2.AddTelemetry
  L4_2 = mp
  L4_2 = L4_2.bitor
  L5_2 = mp
  L5_2 = L5_2.bitor
  L6_2 = nri
  L6_2 = L6_2.Telemetry_HOSTNAME
  L7_2 = nri
  L7_2 = L7_2.Telemetry_PATH
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = nri
  L6_2 = L6_2.Telemetry_QUERY
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L1_2
  L3_2(L4_2, L5_2)
end

reportHeaders = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "string" then
      goto lbl_10
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = {}
  L3_2 = {}
  L3_2.SIG_CONTEXT = "BM"
  L3_2.CONTEXT_SOURCE = A1_2
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = A0_2
  L6_2 = "://"
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    L4_2 = {}
    L5_2 = A0_2
    L4_2[1] = L5_2
    L2_2 = L4_2
  else
    L4_2 = "http://"
    L5_2 = A0_2
    L4_2 = L4_2 .. L5_2
    L2_2[1] = L4_2
    L4_2 = "http://www."
    L5_2 = A0_2
    L4_2 = L4_2 .. L5_2
    L2_2[2] = L4_2
    L4_2 = "https://"
    L5_2 = A0_2
    L4_2 = L4_2 .. L5_2
    L2_2[3] = L4_2
    L4_2 = "https://www."
    L5_2 = A0_2
    L4_2 = L4_2 .. L5_2
    L2_2[4] = L4_2
  end
  L4_2 = pcall
  L5_2 = mp
  L5_2 = L5_2.GetUrlReputation
  L6_2 = L2_2
  L7_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 and L5_2 then
    L6_2 = L5_2.urls
    if L6_2 then
      goto lbl_59
    end
  end
  L6_2 = false
  do return L6_2 end
  ::lbl_59::
  L6_2 = ipairs
  L7_2 = L5_2.urls
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = L10_2.determination
    if L11_2 == 1 then
      L11_2 = true
      return L11_2
    end
  end
end

isTrustedDomain = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 60
  L2_2 = "MpTamperProtectionState"
  if A0_2 == nil then
    A0_2 = true
  end
  if A0_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "off"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = false
      return L3_2
    end
    L3_2 = MpCommon
    L3_2 = L3_2.QueryPersistContextNoPath
    L4_2 = L2_2
    L5_2 = "on"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.GetRegValueAsDword
    L5_2 = L3_2
    L6_2 = "TamperProtection"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L5_2 = mp
      L5_2 = L5_2.bitand
      L6_2 = L4_2
      L7_2 = 1
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 == 1 then
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "on"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        return L4_2
      else
        L5_2 = MpCommon
        L5_2 = L5_2.SetPersistContextNoPath
        L6_2 = L2_2
        L7_2 = {}
        L8_2 = "off"
        L7_2[1] = L8_2
        L8_2 = L1_2
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = false
        return L5_2
      end
    end
  end
  L4_2 = false
  return L4_2
end

isTamperProtectionOn = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = sysio
    L2_2 = L2_2.GetRegValueAsDword
    L3_2 = L1_2
    L4_2 = "TamperProtectionSource"
    L2_2 = L2_2(L3_2, L4_2)
    L0_2 = L2_2
  end
  return L0_2
end

getTamperProtectionSource = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 == nil then
    L1_2 = nil
    return L1_2
  end
  L1_2 = #A0_2
  if 0 < L1_2 then
    L1_2 = crypto
    L1_2 = L1_2.Sha1Buffer
    L2_2 = A0_2
    L3_2 = 0
    L4_2 = #A0_2
    return L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
    return L1_2
  end
end

scrubData = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 ~= nil and A1_2 ~= nil then
    L2_2 = next
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = A0_2
  L3_2 = ipairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 ~= nil and L7_2 ~= "" then
      L8_2 = scrubData
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L9_2 = string
      L9_2 = L9_2.find
      L10_2 = A0_2
      L11_2 = L7_2
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 ~= nil then
        L9_2 = string
        L9_2 = L9_2.gsub
        L10_2 = L2_2
        L11_2 = L7_2
        L12_2 = L8_2
        L9_2 = L9_2(L10_2, L11_2, L12_2)
        L2_2 = L9_2
      end
    end
  end
  return L2_2
end

scrubSubstringInData = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.QuerySessionInformation
    L10_2 = A0_2
    L11_2 = L7_2
    L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2)
    if L8_2 and L9_2 then
      L2_2[L6_2] = L9_2
    end
  end
  L3_2 = next
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil then
    L3_2 = {}
    return L3_2
  end
  return L2_2
end

querySessionInformation = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  if L0_2 == nil then
    L1_2 = {}
    return L1_2
  end
  L1_2 = {}
  L2_2 = {}
  L1_2.User = L2_2
  L2_2 = {}
  L1_2.Session = L2_2
  L2_2 = {}
  L3_2 = MpCommon
  L3_2 = L3_2.WTSUserName
  L2_2.UserName = L3_2
  L3_2 = MpCommon
  L3_2 = L3_2.WTSDomainName
  L2_2.Domain = L3_2
  L3_2 = {}
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientAddress
  L3_2.ClientIP = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientName
  L3_2.ClientName = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSWinStationName
  L3_2.WinStationName = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSSessionId
  L3_2.Id = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientBuildNumber
  L3_2.ClientBuildNumber = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientProductId
  L3_2.ClientProductId = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientProtocolType
  L3_2.ClientProtocolType = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSConnectState
  L3_2.ClientConnectState = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSClientInfo
  L3_2.ClientInfo = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSSessionInfo
  L3_2.ClientSessionInfo = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSConfigInfo
  L3_2.ConfigInfo = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSIsRemoteSession
  L3_2.IsRemoteSession = L4_2
  L4_2 = querySessionInformation
  L5_2 = L0_2.ppid
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  L1_2.User = L4_2
  L4_2 = querySessionInformation
  L5_2 = L0_2.ppid
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L1_2.Session = L4_2
  L4_2 = L1_2.User
  if L4_2 then
    L4_2 = L1_2.Session
    if L4_2 then
      L4_2 = {}
      L5_2 = L1_2.User
      L5_2 = L5_2.UserName
      L6_2 = L1_2.User
      L6_2 = L6_2.Domain
      L7_2 = L1_2.Session
      L7_2 = L7_2.ClientName
      L8_2 = L1_2.Session
      L8_2 = L8_2.WinStationName
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L4_2[4] = L8_2
      L5_2 = L1_2.Session
      L5_2 = L5_2.ClientIP
      if L5_2 ~= nil then
        L5_2 = type
        L6_2 = L1_2.Session
        L6_2 = L6_2.ClientIP
        L5_2 = L5_2(L6_2)
        if L5_2 == "table" then
          L5_2 = L1_2.Session
          L6_2 = L1_2.Session
          L6_2 = L6_2.ClientIP
          L6_2 = L6_2.Address
          L5_2.ClientIP = L6_2
        end
      end
      L5_2 = ""
      L6_2 = false
      L7_2 = pcall
      L8_2 = MpCommon
      L8_2 = L8_2.GetUserAccountInfo
      L9_2 = L1_2.User
      L9_2 = L9_2.Domain
      L10_2 = L1_2.User
      L10_2 = L10_2.UserName
      L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2 = L8_2
      L6_2 = L7_2
      if L6_2 and L5_2 then
        L7_2 = scrubData
        L8_2 = L5_2.Name
        L7_2 = L7_2(L8_2)
        L5_2.Name = L7_2
        L7_2 = L1_2.User
        L7_2.Info = L5_2
        L7_2 = L1_2.User
        L7_2 = L7_2.Info
        L8_2 = scrubSubstringInData
        L9_2 = L1_2.User
        L9_2 = L9_2.Info
        L9_2 = L9_2.HomeDir
        L10_2 = L4_2
        L8_2 = L8_2(L9_2, L10_2)
        L7_2.HomeDir = L8_2
        L7_2 = L1_2.User
        L7_2 = L7_2.Info
        L8_2 = scrubSubstringInData
        L9_2 = L1_2.User
        L9_2 = L9_2.Info
        L9_2 = L9_2.ProfilePath
        L10_2 = L4_2
        L8_2 = L8_2(L9_2, L10_2)
        L7_2.ProfilePath = L8_2
      end
      L7_2 = pcall
      L8_2 = MpCommon
      L8_2 = L8_2.GetUserAccountGroups
      L9_2 = L1_2.User
      L9_2 = L9_2.Domain
      L10_2 = L1_2.User
      L10_2 = L10_2.UserName
      L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2 = L8_2
      L6_2 = L7_2
      if L6_2 and L5_2 then
        L7_2 = L1_2.User
        L8_2 = {}
        L7_2.Groups = L8_2
        L7_2 = ipairs
        L8_2 = L5_2
        L7_2, L8_2, L9_2 = L7_2(L8_2)
        for L10_2, L11_2 in L7_2, L8_2, L9_2 do
          L12_2 = table
          L12_2 = L12_2.insert
          L13_2 = L1_2.User
          L13_2 = L13_2.Groups
          L14_2 = scrubData
          L15_2 = L11_2.Name
          L14_2, L15_2 = L14_2(L15_2)
          L12_2(L13_2, L14_2, L15_2)
        end
      end
      L7_2 = L1_2.User
      L8_2 = scrubData
      L9_2 = L1_2.User
      L9_2 = L9_2.UserName
      L8_2 = L8_2(L9_2)
      L7_2.UserName = L8_2
      L7_2 = L1_2.User
      L8_2 = scrubData
      L9_2 = L1_2.User
      L9_2 = L9_2.Domain
      L8_2 = L8_2(L9_2)
      L7_2.Domain = L8_2
      L7_2 = L1_2.Session
      L8_2 = scrubData
      L9_2 = L1_2.Session
      L9_2 = L9_2.ClientName
      L8_2 = L8_2(L9_2)
      L7_2.ClientName = L8_2
      L7_2 = L1_2.Session
      L8_2 = scrubData
      L9_2 = L1_2.Session
      L9_2 = L9_2.WinStationName
      L8_2 = L8_2(L9_2)
      L7_2.WinStationName = L8_2
      L7_2 = L1_2.Session
      L7_2 = L7_2.ConfigInfo
      if L7_2 then
        L7_2 = type
        L8_2 = L1_2.Session
        L8_2 = L8_2.ConfigInfo
        L7_2 = L7_2(L8_2)
        if L7_2 ~= "string" then
          L7_2 = L1_2.Session
          L7_2 = L7_2.ConfigInfo
          L8_2 = scrubData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ConfigInfo
          L9_2 = L9_2.LogonDomain
          L8_2 = L8_2(L9_2)
          L7_2.LogonDomain = L8_2
          L7_2 = L1_2.Session
          L7_2 = L7_2.ConfigInfo
          L8_2 = scrubData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ConfigInfo
          L9_2 = L9_2.LogonUserName
          L8_2 = L8_2(L9_2)
          L7_2.LogonUserName = L8_2
          L7_2 = L1_2.Session
          L7_2 = L7_2.ConfigInfo
          L8_2 = scrubSubstringInData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ConfigInfo
          L9_2 = L9_2.InitialProgram
          L10_2 = L4_2
          L8_2 = L8_2(L9_2, L10_2)
          L7_2.InitialProgram = L8_2
          L7_2 = L1_2.Session
          L7_2 = L7_2.ConfigInfo
          L8_2 = scrubSubstringInData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ConfigInfo
          L9_2 = L9_2.WorkDirectory
          L10_2 = L4_2
          L8_2 = L8_2(L9_2, L10_2)
          L7_2.WorkDirectory = L8_2
        end
      end
      L7_2 = L1_2.Session
      L7_2 = L7_2.ClientInfo
      if L7_2 then
        L7_2 = type
        L8_2 = L1_2.Session
        L8_2 = L8_2.ClientInfo
        L7_2 = L7_2(L8_2)
        if L7_2 ~= "string" then
          L7_2 = L1_2.Session
          L7_2 = L7_2.ClientInfo
          L8_2 = scrubSubstringInData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ClientInfo
          L9_2 = L9_2.InitialProgram
          L10_2 = L4_2
          L8_2 = L8_2(L9_2, L10_2)
          L7_2.InitialProgram = L8_2
          L7_2 = L1_2.Session
          L7_2 = L7_2.ClientInfo
          L8_2 = scrubSubstringInData
          L9_2 = L1_2.Session
          L9_2 = L9_2.ClientInfo
          L9_2 = L9_2.WorkDirectory
          L10_2 = L4_2
          L8_2 = L8_2(L9_2, L10_2)
          L7_2.WorkDirectory = L8_2
        end
      end
    end
  end
  return L1_2
end

reportSessionInfoWorker = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = pcall
  L1_2 = reportSessionInfoWorker
  L0_2, L1_2 = L0_2(L1_2)
  if L0_2 and L1_2 then
    L2_2 = bm
    L2_2 = L2_2.add_related_string
    L3_2 = "sessionInfo"
    L4_2 = safeJsonSerialize
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L5_2 = bm
    L5_2 = L5_2.RelatedStringBMReport
    L2_2(L3_2, L4_2, L5_2)
    return L1_2
  else
    L2_2 = bm
    L2_2 = L2_2.add_related_string
    L3_2 = "sessioninfofail"
    L4_2 = L1_2
    L5_2 = bm
    L5_2 = L5_2.RelatedStringBMReport
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = {}
  return L2_2
end

reportSessionInformationInclusive = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  if L0_2 == nil then
    L1_2 = {}
    return L1_2
  end
  L1_2 = false
  L2_2 = false
  L3_2 = pcall
  L4_2 = MpCommon
  L4_2 = L4_2.QuerySessionInformation
  L5_2 = L0_2.ppid
  L6_2 = MpCommon
  L6_2 = L6_2.WTSIsRemoteSession
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2)
  L1_2 = L4_2
  L2_2 = L3_2
  if L2_2 and L1_2 then
    L3_2 = pcall
    L4_2 = reportSessionInfoWorker
    L3_2, L4_2 = L3_2(L4_2)
    if L3_2 and L4_2 then
      L5_2 = bm
      L5_2 = L5_2.add_related_string
      L6_2 = "sessionInfo"
      L7_2 = safeJsonSerialize
      L8_2 = L4_2
      L7_2 = L7_2(L8_2)
      L8_2 = bm
      L8_2 = L8_2.RelatedStringBMReport
      L5_2(L6_2, L7_2, L8_2)
      return L4_2
    else
      L5_2 = bm
      L5_2 = L5_2.add_related_string
      L6_2 = "sessioninfofail"
      L7_2 = L4_2
      L8_2 = bm
      L8_2 = L8_2.RelatedStringBMReport
      L5_2(L6_2, L7_2, L8_2)
    end
  end
  L3_2 = {}
  return L3_2
end

reportSessionInformation = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  if not A0_2 then
    A0_2 = 0
  end
  L1_2 = add_parents
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = MpCommon
    L8_2 = L8_2.IsFriendlyProcess
    L9_2 = L7_2.ppid
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L9_2 = L7_2.image_Path
      if L9_2 then
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = L2_2
        L11_2 = L7_2.image_path
        L9_2(L10_2, L11_2)
        if A0_2 == 0 then
          L9_2 = bm
          L9_2 = L9_2.add_related_file
          L10_2 = L7_2.image_path
          L9_2(L10_2)
        end
      end
      L9_2 = pcall
      L10_2 = bm
      L10_2 = L10_2.request_SMS
      L11_2 = L7_2.ppid
      L12_2 = "H"
      L9_2(L10_2, L11_2, L12_2)
    end
    L9_2 = mp
    L9_2 = L9_2.GetProcessCommandLine
    L10_2 = L7_2.ppid
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L10_2 = pcall
      L11_2 = mp
      L11_2 = L11_2.GetExecutablesFromCommandLine
      L12_2 = L9_2
      L10_2, L11_2 = L10_2(L11_2, L12_2)
      if L10_2 and L11_2 then
        L12_2 = ipairs
        L13_2 = L11_2
        L12_2, L13_2, L14_2 = L12_2(L13_2)
        for L15_2, L16_2 in L12_2, L13_2, L14_2 do
          L17_2 = mp
          L17_2 = L17_2.ContextualExpandEnvironmentVariables
          L18_2 = L16_2
          L17_2 = L17_2(L18_2)
          L16_2 = L17_2
          if L16_2 then
            L17_2 = mp
            L17_2 = L17_2.IsKnownFriendlyFile
            L18_2 = L16_2
            L19_2 = true
            L20_2 = true
            L17_2 = L17_2(L18_2, L19_2, L20_2)
            if L17_2 == nil or L17_2 == false then
              if A0_2 == 1 then
                L18_2 = bm
                L18_2 = L18_2.add_threat_file
                L19_2 = L16_2
                L18_2(L19_2)
              end
              if A0_2 == 0 then
                L18_2 = bm
                L18_2 = L18_2.add_related_file
                L19_2 = L16_2
                L18_2(L19_2)
              end
              L18_2 = table
              L18_2 = L18_2.insert
              L19_2 = L2_2
              L20_2 = L16_2
              L18_2(L19_2, L20_2)
            end
          end
        end
      end
      L12_2 = pcall
      L13_2 = mp
      L13_2 = L13_2.GetInlineScriptsFromCommandLine
      L14_2 = L9_2
      L12_2, L13_2 = L12_2(L13_2, L14_2)
      if L12_2 and L13_2 then
        L14_2 = ipairs
        L15_2 = L13_2
        L14_2, L15_2, L16_2 = L14_2(L15_2)
        for L17_2, L18_2 in L14_2, L15_2, L16_2 do
          L19_2 = mp
          L19_2 = L19_2.ContextualExpandEnvironmentVariables
          L20_2 = L18_2
          L19_2 = L19_2(L20_2)
          L18_2 = L19_2
          if L18_2 then
            L19_2 = string
            L19_2 = L19_2.match
            L20_2 = L18_2
            L21_2 = "^[%a]:\\"
            L19_2 = L19_2(L20_2, L21_2)
            if L19_2 then
              L19_2 = mp
              L19_2 = L19_2.IsKnownFriendlyFile
              L20_2 = L18_2
              L21_2 = true
              L22_2 = true
              L19_2 = L19_2(L20_2, L21_2, L22_2)
              if L19_2 == nil or L19_2 == false then
                if A0_2 == 1 then
                  L20_2 = bm
                  L20_2 = L20_2.add_threat_file
                  L21_2 = L18_2
                  L20_2(L21_2)
                end
                if A0_2 == 0 then
                  L20_2 = bm
                  L20_2 = L20_2.add_related_file
                  L21_2 = L18_2
                  L20_2(L21_2)
                end
                L20_2 = table
                L20_2 = L20_2.insert
                L21_2 = L2_2
                L22_2 = L18_2
                L20_2(L21_2, L22_2)
              end
            end
          end
        end
      end
    end
  end
  return L2_2
end

reportRelevantUntrustedEntities = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = {}
  while A0_2 do
    L2_2 = MpCommon
    L2_2 = L2_2.GetImagePathFromPid
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = mp
    L3_2 = L3_2.GetProcessCommandLine
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = MpCommon
    L4_2 = L4_2.IsFriendlyProcess
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if not L4_2 and L2_2 then
      L5_2 = table
      L5_2 = L5_2.insert
      L6_2 = L1_2
      L7_2 = L2_2
      L5_2(L6_2, L7_2)
    end
    if L3_2 then
      L5_2 = pcall
      L6_2 = mp
      L6_2 = L6_2.GetExecutablesFromCommandLine
      L7_2 = L3_2
      L5_2, L6_2 = L5_2(L6_2, L7_2)
      if L5_2 and L6_2 then
        L7_2 = ipairs
        L8_2 = L6_2
        L7_2, L8_2, L9_2 = L7_2(L8_2)
        for L10_2, L11_2 in L7_2, L8_2, L9_2 do
          L12_2 = mp
          L12_2 = L12_2.ContextualExpandEnvironmentVariables
          L13_2 = L11_2
          L12_2 = L12_2(L13_2)
          L11_2 = L12_2
          if L11_2 then
            L12_2 = mp
            L12_2 = L12_2.IsKnownFriendlyFile
            L13_2 = L11_2
            L14_2 = true
            L15_2 = false
            L12_2 = L12_2(L13_2, L14_2, L15_2)
            if L12_2 == nil or L12_2 == false then
              L13_2 = false
              L14_2 = 0
              L15_2 = 0
              L16_2 = MpCommon
              L16_2 = L16_2.PathToWin32Path
              L17_2 = L11_2
              L16_2 = L16_2(L17_2)
              if L16_2 then
                L17_2 = string
                L17_2 = L17_2.match
                L18_2 = L16_2
                L19_2 = "^[%a]:\\"
                L17_2 = L17_2(L18_2, L19_2)
                if L17_2 then
                  L17_2 = sysio
                  L17_2 = L17_2.IsPathAVExcluded
                  L18_2 = L16_2
                  L19_2 = false
                  L17_2 = L17_2(L18_2, L19_2)
                  L13_2 = L17_2
                  L17_2 = sysio
                  L17_2 = L17_2.GetFileSize
                  L18_2 = L16_2
                  L17_2 = L17_2(L18_2)
                  L14_2 = L17_2
                  L17_2 = sysio
                  L17_2 = L17_2.IsFileExists
                  L18_2 = L16_2
                  L17_2 = L17_2(L18_2)
                  if L17_2 then
                    L17_2 = sysio
                    L17_2 = L17_2.GetFileLastWriteTime
                    L18_2 = L16_2
                    L17_2 = L17_2(L18_2)
                    L18_2 = L17_2 / 10000000
                    L17_2 = L18_2 - 11644473600
                    L18_2 = MpCommon
                    L18_2 = L18_2.GetCurrentTimeT
                    L18_2 = L18_2()
                    L15_2 = L18_2 - L17_2
                    L19_2 = {}
                    L19_2.path = L11_2
                    L19_2.isAVExcluded = L13_2
                    L19_2.size = L14_2
                    L19_2.age = L15_2
                    L20_2 = table
                    L20_2 = L20_2.insert
                    L21_2 = L1_2
                    L22_2 = L19_2
                    L20_2(L21_2, L22_2)
                  end
                end
              end
            end
          end
        end
      end
      L7_2 = pcall
      L8_2 = mp
      L8_2 = L8_2.GetInlineScriptsFromCommandLine
      L9_2 = L3_2
      L7_2, L8_2 = L7_2(L8_2, L9_2)
      if L7_2 and L8_2 then
        L9_2 = ipairs
        L10_2 = L8_2
        L9_2, L10_2, L11_2 = L9_2(L10_2)
        for L12_2, L13_2 in L9_2, L10_2, L11_2 do
          L14_2 = mp
          L14_2 = L14_2.ContextualExpandEnvironmentVariables
          L15_2 = L13_2
          L14_2 = L14_2(L15_2)
          L13_2 = L14_2
          if L13_2 then
            L14_2 = mp
            L14_2 = L14_2.IsKnownFriendlyFile
            L15_2 = L13_2
            L16_2 = true
            L17_2 = false
            L14_2 = L14_2(L15_2, L16_2, L17_2)
            if L14_2 == nil or L14_2 == false then
              L15_2 = false
              L16_2 = 0
              L17_2 = 0
              L18_2 = MpCommon
              L18_2 = L18_2.PathToWin32Path
              L19_2 = L13_2
              L18_2 = L18_2(L19_2)
              if L18_2 then
                L19_2 = string
                L19_2 = L19_2.find
                L20_2 = L18_2
                L21_2 = "^[%a]:\\"
                L19_2 = L19_2(L20_2, L21_2)
                if L19_2 then
                  L19_2 = sysio
                  L19_2 = L19_2.IsPathAVExcluded
                  L20_2 = L18_2
                  L21_2 = false
                  L19_2 = L19_2(L20_2, L21_2)
                  L15_2 = L19_2
                  L19_2 = sysio
                  L19_2 = L19_2.GetFileSize
                  L20_2 = L18_2
                  L19_2 = L19_2(L20_2)
                  L16_2 = L19_2
                  L19_2 = sysio
                  L19_2 = L19_2.IsFileExists
                  L20_2 = L18_2
                  L19_2 = L19_2(L20_2)
                  if L19_2 then
                    L19_2 = sysio
                    L19_2 = L19_2.GetFileLastWriteTime
                    L20_2 = L18_2
                    L19_2 = L19_2(L20_2)
                    L20_2 = L19_2 / 10000000
                    L19_2 = L20_2 - 11644473600
                    L20_2 = MpCommon
                    L20_2 = L20_2.GetCurrentTimeT
                    L20_2 = L20_2()
                    L17_2 = L20_2 - L19_2
                    L21_2 = {}
                    L21_2.path = L13_2
                    L21_2.isAVExcluded = L15_2
                    L21_2.size = L16_2
                    L21_2.age = L17_2
                    L22_2 = table
                    L22_2 = L22_2.insert
                    L23_2 = L1_2
                    L24_2 = L21_2
                    L22_2(L23_2, L24_2)
                  end
                end
              end
            end
          end
        end
      end
    end
    L5_2 = mp
    L5_2 = L5_2.GetParentProcInfo
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      break
    end
    A0_2 = L5_2.ppid
  end
  return L1_2
end

reportRelevantUntrustedEntitiesForPid = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  L1_2 = add_parents
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = table
  L2_2 = L2_2.insert
  L3_2 = L1_2
  L4_2 = L0_2
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = mp
    L8_2 = L8_2.GetProcessCommandLine
    L9_2 = L7_2.ppid
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = pcall
      L10_2 = mp
      L10_2 = L10_2.GetExecutablesFromCommandLine
      L11_2 = L8_2
      L9_2, L10_2 = L9_2(L10_2, L11_2)
      if L9_2 and L10_2 then
        L11_2 = ipairs
        L12_2 = L10_2
        L11_2, L12_2, L13_2 = L11_2(L12_2)
        for L14_2, L15_2 in L11_2, L12_2, L13_2 do
          L16_2 = mp
          L16_2 = L16_2.ContextualExpandEnvironmentVariables
          L17_2 = L15_2
          L16_2 = L16_2(L17_2)
          L15_2 = L16_2
          if L15_2 then
            L16_2 = MpCommon
            L16_2 = L16_2.PathToWin32Path
            L17_2 = L15_2
            L16_2 = L16_2(L17_2)
            if L16_2 then
              L17_2 = sysio
              L17_2 = L17_2.IsPathAVExcluded
              L18_2 = L16_2
              L19_2 = false
              L17_2 = L17_2(L18_2, L19_2)
              if L17_2 then
                L18_2 = table
                L18_2 = L18_2.insert
                L19_2 = L2_2
                L20_2 = L16_2
                L18_2(L19_2, L20_2)
              end
            end
          end
        end
      end
      L11_2 = pcall
      L12_2 = mp
      L12_2 = L12_2.GetInlineScriptsFromCommandLine
      L13_2 = L8_2
      L11_2, L12_2 = L11_2(L12_2, L13_2)
      if L11_2 and L12_2 then
        L13_2 = ipairs
        L14_2 = L12_2
        L13_2, L14_2, L15_2 = L13_2(L14_2)
        for L16_2, L17_2 in L13_2, L14_2, L15_2 do
          L18_2 = mp
          L18_2 = L18_2.ContextualExpandEnvironmentVariables
          L19_2 = L17_2
          L18_2 = L18_2(L19_2)
          L17_2 = L18_2
          if L17_2 then
            L18_2 = MpCommon
            L18_2 = L18_2.PathToWin32Path
            L19_2 = L17_2
            L18_2 = L18_2(L19_2)
            if L18_2 then
              L19_2 = sysio
              L19_2 = L19_2.IsPathAVExcluded
              L20_2 = L18_2
              L21_2 = false
              L19_2 = L19_2(L20_2, L21_2)
              if L19_2 then
                L20_2 = table
                L20_2 = L20_2.insert
                L21_2 = L2_2
                L22_2 = L18_2
                L20_2(L21_2, L22_2)
              end
            end
          end
        end
      end
    end
  end
  L3_2 = next
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = table_dedup_caseinsensitive
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
    L3_2 = bm
    L3_2 = L3_2.add_related_string
    L4_2 = "AVExcludedEntities"
    L5_2 = safeJsonSerialize
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L6_2 = bm
    L6_2 = L6_2.RelatedStringBMReport
    L3_2(L4_2, L5_2, L6_2)
  end
  return L2_2
end

reportAVExcludedEntities = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L4_2 = bm
  L4_2 = L4_2.trigger_sig
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = bm
  L4_2 = L4_2.get_process_relationships
  L5_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2)
  if L5_2 ~= nil then
    L6_2 = next
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 ~= nil then
      goto lbl_20
    end
  end
  L6_2 = 1
  do return L6_2 end
  ::lbl_20::
  L6_2 = 1
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = L11_2.ppid
    if L12_2 ~= nil then
      L12_2 = 1
      L13_2 = mp
      L13_2 = L13_2.bitand
      L14_2 = L11_2.reason_ex
      L15_2 = L12_2
      L13_2 = L13_2(L14_2, L15_2)
      if L13_2 == L12_2 then
        L14_2 = A3_2 + L6_2
        if L14_2 < 500 then
          L14_2 = recursiveTriggerSig
          L15_2 = A0_2
          L16_2 = A1_2
          L17_2 = ";"
          L18_2 = L11_2.ppid
          L16_2 = L16_2 .. L17_2 .. L18_2
          L17_2 = L11_2.ppid
          L18_2 = A3_2 + L6_2
          L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          L6_2 = L6_2 + L14_2
        end
      end
    end
  end
  return L6_2
end

recursiveTriggerSig = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = {}
  L3_2 = safeJsonDeserialize
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2.gen_ransom_meta = L3_2
  L4_2 = reportSessionInformation
  L4_2 = L4_2()
  L2_2.session_info = L4_2
  if not A1_2 then
    A1_2 = false
  end
  if A1_2 then
    L5_2 = versioning
    L5_2 = L5_2.IsSeville
    L5_2 = L5_2()
    if L5_2 then
      L5_2 = bm
      L5_2 = L5_2.set_detection_string
      L6_2 = safeJsonSerialize
      L7_2 = L2_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L6_2(L7_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    end
  end
  L5_2 = add_parents
  L5_2()
  if L3_2 ~= nil then
    L5_2 = L3_2.file_list
    if L5_2 ~= nil then
      L5_2 = L3_2.appended_ext
      if L5_2 ~= nil then
        L5_2 = L3_2.proc_info
        if L5_2 ~= nil then
          L5_2 = L3_2.magic_mismatch
          if L5_2 ~= nil then
            L5_2 = bm
            L5_2 = L5_2.get_current_process_startup_info
            L5_2 = L5_2()
            if L5_2 ~= nil then
              L5_2 = L5_2.ppid
            else
              L5_2 = -2
            end
            L6_2 = "FileChain_SubSet:"
            L7_2 = bm
            L7_2 = L7_2.add_related_file
            L8_2 = L3_2.cur_image_path
            L7_2(L8_2)
            L7_2 = bm
            L7_2 = L7_2.add_related_string
            L8_2 = "debug_proc_info"
            L9_2 = "old <"
            L10_2 = L3_2.proc_info
            L11_2 = "> new <"
            L12_2 = L5_2
            L13_2 = ">"
            L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
            L10_2 = bm
            L10_2 = L10_2.RelatedStringBMReport
            L7_2(L8_2, L9_2, L10_2)
            L7_2 = bm
            L7_2 = L7_2.add_related_string
            L8_2 = "ransom_extension"
            L9_2 = L3_2.appended_ext
            L10_2 = bm
            L10_2 = L10_2.RelatedStringBMReport
            L7_2(L8_2, L9_2, L10_2)
            L7_2 = bm
            L7_2 = L7_2.add_related_string
            L8_2 = "magic_mismatch"
            L9_2 = tostring
            L10_2 = L3_2.magic_mismatch
            L9_2 = L9_2(L10_2)
            L10_2 = bm
            L10_2 = L10_2.RelatedStringBMReport
            L7_2(L8_2, L9_2, L10_2)
            L7_2 = pairs
            L8_2 = L3_2.file_list
            L7_2, L8_2, L9_2 = L7_2(L8_2)
            for L10_2, L11_2 in L7_2, L8_2, L9_2 do
              L12_2 = L11_2
              L13_2 = string
              L13_2 = L13_2.find
              L14_2 = L12_2
              L15_2 = "\\[^\\]*$"
              L13_2 = L13_2(L14_2, L15_2)
              if not L13_2 then
                L13_2 = 0
              end
              L14_2 = string
              L14_2 = L14_2.find
              L15_2 = L12_2
              L16_2 = "."
              L17_2 = L13_2
              L18_2 = true
              L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
              if L14_2 ~= nil then
                L15_2 = string
                L15_2 = L15_2.sub
                L16_2 = L12_2
                L17_2 = L13_2 + 1
                L18_2 = L14_2 - 1
                L15_2 = L15_2(L16_2, L17_2, L18_2)
                L16_2 = L6_2
                L17_2 = crypto
                L17_2 = L17_2.CRC32Buffer
                L18_2 = -1
                L19_2 = L15_2
                L20_2 = 0
                L21_2 = #L15_2
                L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
                L6_2 = L16_2 .. L17_2
                L16_2 = L6_2
                L17_2 = ";"
                L18_2 = string
                L18_2 = L18_2.sub
                L19_2 = L12_2
                L20_2 = L14_2 + 1
                L18_2 = L18_2(L19_2, L20_2)
                L19_2 = ";"
                L6_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
              end
            end
            L7_2 = bm
            L7_2 = L7_2.add_related_string
            L8_2 = "ransom_files_sub"
            L9_2 = L6_2
            L10_2 = bm
            L10_2 = L10_2.RelatedStringBMReport
            L7_2(L8_2, L9_2, L10_2)
            L7_2 = pcall
            L8_2 = reportBmInfo
            L7_2, L8_2 = L7_2(L8_2)
            if not L7_2 and L8_2 then
              L9_2 = bm
              L9_2 = L9_2.add_related_string
              L10_2 = "bmInfoFailReason"
              L11_2 = tostring
              L12_2 = L8_2
              L11_2 = L11_2(L12_2)
              L12_2 = bm
              L12_2 = L12_2.RelatedStringBMReport
              L9_2(L10_2, L11_2, L12_2)
            end
            L9_2 = mp
            L9_2 = L9_2.INFECTED
            return L9_2
          end
        end
      end
    end
  end
  L5_2 = mp
  L5_2 = L5_2.CLEAN
  return L5_2
end

reportGenericRansomware = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = pcall
  L2_2 = mp
  L2_2 = L2_2.GetUrlReputation
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L4_2 = {}
  L4_2.TAG = "NOLOOKUP"
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)
  if L1_2 and L2_2 then
    L3_2 = L2_2.urls
    L4_2 = ipairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = L8_2.determination
      if L9_2 == 2 then
        L9_2 = L8_2.urlresponsecontext
        if L9_2 then
          L10_2 = ""
          L11_2 = ipairs
          L12_2 = L9_2
          L11_2, L12_2, L13_2 = L11_2(L12_2)
          for L14_2, L15_2 in L11_2, L12_2, L13_2 do
            L16_2 = L15_2.key
            L17_2 = L15_2.value
            if L16_2 == "MaceFamily" then
              L18_2 = string
              L18_2 = L18_2.lower
              L19_2 = L17_2
              L18_2 = L18_2(L19_2)
              L10_2 = L18_2
              break
            end
          end
          if L10_2 ~= "" then
            L11_2 = true
            L12_2 = L10_2
            L13_2 = L8_2.confidence
            return L11_2, L12_2, L13_2
          end
        end
      end
    end
  end
  L3_2 = false
  L4_2 = nil
  L5_2 = nil
  return L3_2, L4_2, L5_2
end

maceGetUrlReputation = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = AppendToRollingQueue
    L2_3 = "MaceNoRep"
    L3_3 = A0_3
    L4_3 = 1
    L5_3 = 86400
    L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = IsKeyInRollingQueue
    L2_3 = "MaceNoRep"
    L3_3 = A0_3
    L4_3 = true
    return L1_3(L2_3, L3_3, L4_3)
  end
  
  if not A0_2 or A0_2 ~= 28688 and A0_2 ~= 28674 then
    L3_2 = mp
    L3_2 = L3_2.CLEAN
    return L3_2
  end
  L3_2 = mp
  L3_2 = L3_2.SIGATTR_LOG_SZ
  if L3_2 == 0 then
    L3_2 = mp
    L3_2 = L3_2.CLEAN
    return L3_2
  end
  L3_2 = reportHeaders
  L4_2 = {}
  L5_2 = "Host"
  L6_2 = "User-Agent"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L3_2(L4_2)
  L3_2 = nil
  L4_2 = mp
  L4_2 = L4_2.SIGATTR_LOG_SZ
  L5_2 = 1
  L6_2 = -1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = sigattr_tail
    L8_2 = L8_2[L7_2]
    if A0_2 == 28688 then
      L9_2 = L8_2.attribute
      if L9_2 == A0_2 then
        L9_2 = L8_2.matched
        if L9_2 then
          L9_2 = L8_2.utf8p1
          if L9_2 then
            L9_2 = L8_2.np2
            if L9_2 then
              L9_2 = string
              L9_2 = L9_2.format
              L10_2 = "%s:%d"
              L11_2 = L8_2.utf8p1
              L12_2 = L8_2.np2
              L9_2 = L9_2(L10_2, L11_2, L12_2)
              L3_2 = L9_2
              break
            end
          end
        end
      end
    end
    if A0_2 == 28674 then
      L9_2 = L8_2.attribute
      if L9_2 == A0_2 then
        L9_2 = L8_2.matched
        if L9_2 then
          L9_2 = L8_2.utf8p1
          if L9_2 then
            L3_2 = L8_2.utf8p1
            break
          end
        end
      end
    end
  end
  if not L3_2 then
    L4_2 = mp
    L4_2 = L4_2.CLEAN
    return L4_2
  end
  L4_2 = L2_2
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = maceGetUrlReputation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = true
      return L4_2
  end
  else
    L4_2 = L1_2
    L5_2 = L3_2
    L4_2(L5_2)
  end
  L4_2 = false
  return L4_2
end

isAttrBadMaceRep = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = GetRollingQueueKeys
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = type
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      L2_2 = ipairs
      L3_2 = L1_2
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2, L6_2 in L2_2, L3_2, L4_2 do
        L7_2 = 512
        L8_2 = 1
        L9_2 = #L6_2
        L10_2 = L7_2
        for L11_2 = L8_2, L9_2, L10_2 do
          L12_2 = string
          L12_2 = L12_2.format
          L13_2 = "mace_%d"
          if L11_2 == 1 then
            L14_2 = L11_2 - 1
            if L14_2 then
              goto lbl_30
            end
          end
          L14_2 = L11_2 - 1
          L14_2 = L14_2 / L7_2
          ::lbl_30::
          L12_2 = L12_2(L13_2, L14_2)
          L13_2 = string
          L13_2 = L13_2.sub
          L14_2 = L6_2
          L15_2 = L11_2
          L16_2 = L11_2 + L7_2
          L16_2 = L16_2 - 1
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          L14_2 = bm
          L14_2 = L14_2.add_related_string
          L15_2 = L12_2
          L16_2 = L13_2
          L17_2 = bm
          L17_2 = L17_2.RelatedStringBMReport
          L14_2(L15_2, L16_2, L17_2)
        end
        L8_2 = versioning
        L8_2 = L8_2.IsSeville
        L8_2 = L8_2()
        if L8_2 then
          L8_2 = bm
          L8_2 = L8_2.set_detection_string
          L9_2 = L6_2
          L8_2(L9_2)
        end
        break
      end
    end
  end
end

maceSendConfig = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = mp
  L0_2 = L0_2.enum_mpattributesubstring
  L1_2 = "Behavior:"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = #L0_2
    if 0 < L1_2 then
      L1_2 = ipairs
      L2_2 = L0_2
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = bm
        L6_2 = L6_2.add_related_string
        L7_2 = "RelatedBMHits"
        L8_2 = L5_2
        L9_2 = bm
        L9_2 = L9_2.RelatedStringBMReport
        L6_2(L7_2, L8_2, L9_2)
      end
    end
  end
end

reportRelatedBmHits = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2
  if not L1_2 or L1_2 == "" then
    L2_2 = pcall
    L3_2 = bm
    L3_2 = L3_2.get_current_process_startup_info
    L2_2, L3_2 = L2_2(L3_2)
    if L2_2 and L3_2 then
      L4_2 = L3_2.ppid
      if L4_2 then
        goto lbl_18
      end
    end
    do return end
    ::lbl_18::
    L1_2 = L3_2.ppid
  end
  L2_2 = pcall
  L3_2 = bm
  L3_2 = L3_2.get_process_relationships
  L4_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return
  end
  L5_2 = ipairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = pcall
    L11_2 = bm
    L11_2 = L11_2.add_threat_process
    L12_2 = L9_2.ppid
    L10_2(L11_2, L12_2)
  end
end

addChildrenAsThreat = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = pcall
  L2_2 = bm
  L2_2 = L2_2.get_current_process_startup_info
  L1_2, L2_2 = L1_2(L2_2)
  if L1_2 and L2_2 then
    L3_2 = L2_2.ppid
    if L3_2 then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L3_2 = mp
  L3_2 = L3_2.enum_mpattributesubstring
  L4_2 = ""
  L3_2 = L3_2(L4_2)
  L4_2 = {}
  L5_2 = ""
  L6_2 = ipairs
  L7_2 = L3_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = L4_2[L10_2]
    if not L11_2 then
      L4_2[L10_2] = true
      L11_2 = L5_2
      L12_2 = L10_2
      L13_2 = ";"
      L5_2 = L11_2 .. L12_2 .. L13_2
    end
  end
  L6_2 = bm
  L6_2 = L6_2.get_imagepath
  L6_2 = L6_2()
  L7_2 = bm
  L7_2 = L7_2.get_process_relationships
  L7_2, L8_2 = L7_2()
  L9_2 = nil
  L10_2 = nil
  if L7_2 then
    L11_2 = ipairs
    L12_2 = L7_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      L16_2 = L15_2.image_path
      L17_2 = L15_2.cmd_line
      L18_2 = L15_2.reason_ex
      L19_2 = string
      L19_2 = L19_2.format
      L20_2 = "%d::%s::%s"
      L21_2 = L18_2
      L22_2 = L16_2
      L23_2 = L17_2
      L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
      L9_2 = L19_2
      break
    end
  end
  if L8_2 then
    L11_2 = ipairs
    L12_2 = L8_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      L16_2 = L15_2.image_path
      L17_2 = L15_2.cmd_line
      L18_2 = L15_2.reason_ex
      L19_2 = string
      L19_2 = L19_2.format
      L20_2 = "%d::%s::%s"
      L21_2 = L18_2
      L22_2 = L16_2
      L23_2 = L17_2
      L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
      L10_2 = L19_2
      break
    end
  end
  L11_2 = {}
  L11_2.v = 2
  L12_2 = MpCommon
  L12_2 = L12_2.IsFriendlyProcess
  L13_2 = L2_2.ppid
  L12_2 = L12_2(L13_2)
  L11_2.fr = L12_2
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = "%s::%s"
  L14_2 = L6_2
  L15_2 = L2_2.command_line
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L11_2.pr = L12_2
  L11_2.pa = L9_2
  L11_2.ch = L10_2
  L11_2.bh = L5_2
  L11_2.hs = A0_2
  L12_2 = bm
  L12_2 = L12_2.add_related_string
  L13_2 = "mem_082e767d"
  L14_2 = safeJsonSerialize
  L15_2 = L11_2
  L14_2 = L14_2(L15_2)
  L15_2 = bm
  L15_2 = L15_2.RelatedStringBMReport
  L12_2(L13_2, L14_2, L15_2)
end

takeMemorySnapshot = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L5_2 = bm
  L5_2 = L5_2.trigger_sig
  if L5_2 ~= nil and (A0_2 or A1_2) then
    L5_2 = pcall
    L6_2 = bm
    L6_2 = L6_2.get_current_process_startup_info
    L5_2, L6_2 = L5_2(L6_2)
    if not L5_2 then
      return
    end
    L7_2 = pcall
    L8_2 = bm
    L8_2 = L8_2.get_process_relationships
    L9_2 = L6_2.ppid
    L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      return
    end
    L10_2 = "TriggerMemoryScan"
    L11_2 = string
    L11_2 = L11_2.format
    L12_2 = "Delay:%d;Type:%s;Origin:%s;"
    L13_2 = A3_2
    L14_2 = A2_2
    L15_2 = A4_2
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L12_2 = pcall
    L13_2 = bm
    L13_2 = L13_2.trigger_sig
    L14_2 = L10_2
    L15_2 = L11_2
    L16_2 = L6_2.ppid
    L12_2(L13_2, L14_2, L15_2, L16_2)
    if A1_2 then
      L12_2 = ipairs
      L13_2 = L8_2
      L12_2, L13_2, L14_2 = L12_2(L13_2)
      for L15_2, L16_2 in L12_2, L13_2, L14_2 do
        L17_2 = pcall
        L18_2 = bm
        L18_2 = L18_2.trigger_sig
        L19_2 = L10_2
        L20_2 = L11_2
        L21_2 = L16_2.ppid
        L17_2(L18_2, L19_2, L20_2, L21_2)
      end
    end
    if A0_2 then
      L12_2 = ipairs
      L13_2 = L9_2
      L12_2, L13_2, L14_2 = L12_2(L13_2)
      for L15_2, L16_2 in L12_2, L13_2, L14_2 do
        L17_2 = pcall
        L18_2 = bm
        L18_2 = L18_2.trigger_sig
        L19_2 = L10_2
        L20_2 = L11_2
        L21_2 = L16_2.ppid
        L17_2(L18_2, L19_2, L20_2, L21_2)
      end
    end
  end
end

triggerMemoryScanOnProcessTree = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = ""
  L4_2 = ""
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = ""
  end
  if A0_2 ~= nil then
    L7_2 = A0_2
    L6_2 = A0_2.sub
    L8_2 = 1
    L9_2 = 4
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 == "pid:" then
      L6_2 = "MemQueryTrigger:"
      L7_2 = A1_2
      L3_2 = L6_2 .. L7_2
      L6_2 = "originsig:"
      L7_2 = A1_2
      L8_2 = ";extradata:"
      L9_2 = L5_2
      L4_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
      L6_2 = bm
      L6_2 = L6_2.trigger_sig
      if L6_2 ~= nil then
        L6_2 = pcall
        L7_2 = bm
        L7_2 = L7_2.trigger_sig
        L8_2 = L3_2
        L9_2 = L4_2
        L10_2 = A0_2
        L6_2(L7_2, L8_2, L9_2, L10_2)
      else
        L6_2 = pcall
        L7_2 = MpCommon
        L7_2 = L7_2.BmTriggerSig
        L8_2 = A0_2
        L9_2 = L3_2
        L10_2 = L4_2
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    end
  end
end

triggerMemQueryOnProcess = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "malware_manifest"
  if A1_2 == 0 then
    A1_2 = 3600
  end
  L3_2 = #A0_2
  if 0 < L3_2 then
    L3_2 = MpCommon
    L3_2 = L3_2.SetPersistContextNoPath
    L4_2 = L2_2
    L5_2 = A0_2
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
  end
end

setMalwareManifest = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = "malware_manifest"
  L1_2 = nil
  L2_2 = MpCommon
  L2_2 = L2_2.GetPersistContextCountNoPath
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  if 0 < L2_2 then
    L2_2 = MpCommon
    L2_2 = L2_2.GetPersistContextNoPath
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  return L1_2
end

getMalwareManifest = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 == nil then
    return
  end
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "%.[^/%.]+$"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil then
    return
  end
  if A1_2 == nil or A1_2 == true then
    L3_2 = L2_2
    L4_2 = "\""
    L2_2 = L3_2 .. L4_2
  end
  L3_2 = ".cpt\".gpg\".enc\".e\""
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = L3_2
  L6_2 = L2_2
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = mp
  L4_2 = L4_2.GetExtensionClass
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = L2_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = L4_2 ~= 0
  return L4_2
end

isKnownFileExtension = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = false
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "%.[^/]-%.[^/]-$"
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 ~= nil
  return L1_2
end

isMultiExtensionFileName = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L3_2 = A0_2
  L2_2 = A0_2.gmatch
  L4_2 = "%.[^%.]+"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  L2_2 = L1_2
  L3_2 = #L1_2
  return L2_2, L3_2
end

extractAllFileNameExtensions = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    L2_2 = false
    return L2_2
  end
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "%.[^/%.]+$"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil then
    L3_2 = false
    return L3_2
  end
  if A1_2 == nil or A1_2 == true then
    L3_2 = L2_2
    L4_2 = "\""
    L2_2 = L3_2 .. L4_2
  end
  L3_2 = mp
  L3_2 = L3_2.GetExtensionClass
  L4_2 = string
  L4_2 = L4_2.lower
  L5_2 = L2_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 ~= 4 and L3_2 ~= 0 then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

isFileExtensionOfInterest = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 == nil then
    return
  end
  if A1_2 == nil or A1_2 == true then
    L2_2 = A0_2
    L3_2 = "\""
    A0_2 = L2_2 .. L3_2
  end
  L2_2 = mp
  L2_2 = L2_2.GetExtensionClass
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  return L2_2
end

GetExtensionClassEx = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = pcall
  L1_2 = bm
  L1_2 = L1_2.get_process_relationships
  L0_2, L1_2, L2_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.image_path
    if L8_2 ~= nil then
      L8_2 = bm
      L8_2 = L8_2.add_related_process
      L9_2 = L7_2.ppid
      L8_2(L9_2)
    end
  end
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.image_path
    if L8_2 ~= nil then
      L8_2 = bm
      L8_2 = L8_2.add_related_process
      L9_2 = L7_2.ppid
      L8_2(L9_2)
    end
  end
end

addRelatedProcess = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  L1_2 = bm
  L1_2 = L1_2.get_imagepath
  L1_2 = L1_2()
  if L0_2 ~= nil then
    L2_2 = L0_2.ppid
    if L2_2 ~= nil and L1_2 ~= nil then
      L2_2 = L0_2.command_line
      if L2_2 ~= nil then
        L2_2 = L0_2.command_line
        if L2_2 ~= "" then
          goto lbl_23
        end
      end
    end
  end
  L2_2 = true
  do return L2_2 end
  goto lbl_48
  ::lbl_23::
  L2_2 = IsExcludedByImagePath
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  else
    L2_2 = CheckProcessImagePathAndCommandlineExclusionLinux
    L3_2 = L1_2
    L4_2 = L0_2.command_line
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    else
      L2_2 = isParentPackageManager
      L3_2 = L0_2.ppid
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = true
        return L2_2
      end
    end
  end
  ::lbl_48::
  L2_2 = false
  return L2_2
end

IsProcessExcludedFromRansomwareAnalysis = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = mp
  L0_2 = L0_2.SIGATTR_LOG_SZ
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = 150000000
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  L9_2 = bm
  L9_2 = L9_2.GetSignatureMatchDuration
  L9_2 = L9_2()
  if L5_2 < L9_2 then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = IsProcessExcludedFromRansomwareAnalysis
  L9_2 = L9_2()
  if L9_2 == true then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = bm
  L9_2 = L9_2.get_imagepath
  L9_2 = L9_2()
  if L9_2 == nil or L9_2 == "" then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  L10_2 = 1
  L11_2 = L0_2
  L12_2 = 1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = sigattr_tail
    L14_2 = L14_2[L13_2]
    L14_2 = L14_2.attribute
    if L14_2 == 16384 then
      L15_2 = sigattr_tail
      L15_2 = L15_2[L13_2]
      L15_2 = L15_2.utf8p1
      L16_2 = GetFileEntropy
      L17_2 = L15_2
      L16_2 = L16_2(L17_2)
      L17_2 = L2_2[L15_2]
      if L17_2 == nil and L16_2 ~= nil and 7 <= L16_2 then
        L2_2[L15_2] = true
        L18_2 = L15_2
        L17_2 = L15_2.match
        L19_2 = "%.[^/%.]+$"
        L17_2 = L17_2(L18_2, L19_2)
        L18_2 = isKnownFileExtension
        L19_2 = L15_2
        L18_2 = L18_2(L19_2)
        if L18_2 == false then
          L18_2 = IsRansomwareProcessImagePathExtensionExcluded
          L19_2 = L9_2
          L20_2 = L17_2
          L18_2 = L18_2(L19_2, L20_2)
          if L18_2 == false then
            L18_2 = bm
            L18_2 = L18_2.add_related_file
            L19_2 = L15_2
            L18_2(L19_2)
            if L17_2 ~= nil then
              L18_2 = L1_2[L17_2]
              if L18_2 == nil then
                L6_2 = L6_2 + 1
                L1_2[L17_2] = 1
              else
                L18_2 = L1_2[L17_2]
                L18_2 = L18_2 + 1
                L1_2[L17_2] = L18_2
              end
            end
            L19_2 = L15_2
            L18_2 = L15_2.match
            L20_2 = "[^>]*[\\/$]"
            L18_2 = L18_2(L19_2, L20_2)
            if L18_2 ~= nil then
              L19_2 = L4_2[L18_2]
              if L19_2 == nil then
                L7_2 = L7_2 + 1
                L4_2[L18_2] = 1
              else
                L19_2 = L4_2[L18_2]
                L19_2 = L19_2 + 1
                L4_2[L18_2] = L19_2
              end
            end
          end
        end
      end
    end
  end
  if L6_2 == 0 then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  L10_2 = 1
  L11_2 = L0_2
  L12_2 = 1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = sigattr_tail
    L14_2 = L14_2[L13_2]
    L14_2 = L14_2.attribute
    if L14_2 == 16387 then
      L15_2 = sigattr_tail
      L15_2 = L15_2[L13_2]
      L15_2 = L15_2.utf8p1
      L16_2 = L2_2[L15_2]
      if L16_2 == nil then
        L16_2 = L3_2[L15_2]
        if L16_2 == nil then
          L16_2 = bm
          L16_2 = L16_2.add_related_file
          L17_2 = L15_2
          L16_2(L17_2)
          L3_2[L15_2] = true
          L17_2 = L15_2
          L16_2 = L15_2.match
          L18_2 = "%.[^/%.]+$"
          L16_2 = L16_2(L17_2, L18_2)
          L17_2 = isFileExtensionOfInterest
          L18_2 = L15_2
          L17_2 = L17_2(L18_2)
          if L17_2 then
            L17_2 = IsRansomwareProcessImagePathExtensionExcluded
            L18_2 = L9_2
            L19_2 = L16_2
            L17_2 = L17_2(L18_2, L19_2)
            if L17_2 == false then
              L18_2 = L15_2
              L17_2 = L15_2.match
              L19_2 = "[^>]*[\\/$]"
              L17_2 = L17_2(L18_2, L19_2)
              if L17_2 ~= nil then
                L18_2 = L4_2[L17_2]
                if L18_2 ~= nil then
                  L8_2 = L8_2 + 1
                  L18_2 = L4_2[L17_2]
                  if L18_2 == 1 then
                    L4_2[L17_2] = nil
                  else
                    L18_2 = L4_2[L17_2]
                    L18_2 = L18_2 - 1
                    L4_2[L17_2] = L18_2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if L8_2 == 0 then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  L10_2 = 0
  L11_2 = pairs
  L12_2 = L1_2
  L11_2, L12_2, L13_2 = L11_2(L12_2)
  for L14_2, L15_2 in L11_2, L12_2, L13_2 do
    if L15_2 > L10_2 then
      L10_2 = L15_2
    end
  end
  if L6_2 == 1 and 5 <= L10_2 and L7_2 == 1 and 5 <= L8_2 then
    L11_2 = addRelatedProcess
    L11_2()
    L11_2 = reportRelatedBmHits
    L11_2()
    L11_2 = safeJsonSerialize
    L12_2 = L2_2
    L11_2 = L11_2(L12_2)
    L12_2 = bm
    L12_2 = L12_2.add_related_string
    L13_2 = "file_metadata"
    L14_2 = L11_2
    L15_2 = bm
    L15_2 = L15_2.RelatedStringBMReport
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = mp
    L12_2 = L12_2.INFECTED
    return L12_2
  end
  if L6_2 < 3 and 10 <= L10_2 and 2 <= L7_2 and 3 <= L8_2 then
    L11_2 = addRelatedProcess
    L11_2()
    L11_2 = reportRelatedBmHits
    L11_2()
    L11_2 = safeJsonSerialize
    L12_2 = L2_2
    L11_2 = L11_2(L12_2)
    L12_2 = bm
    L12_2 = L12_2.add_related_string
    L13_2 = "file_metadata"
    L14_2 = L11_2
    L15_2 = bm
    L15_2 = L15_2.RelatedStringBMReport
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = mp
    L12_2 = L12_2.INFECTED
    return L12_2
  end
  L11_2 = mp
  L11_2 = L11_2.CLEAN
  return L11_2
end

analyzeRansomwarePattern1 = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = 50000000
  L6_2 = 0
  L7_2 = 0
  L8_2 = bm
  L8_2 = L8_2.GetSignatureMatchDuration
  L8_2 = L8_2()
  if L5_2 < L8_2 then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = IsProcessExcludedFromRansomwareAnalysis
  L8_2 = L8_2()
  if L8_2 == true then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = bm
  L8_2 = L8_2.get_imagepath
  L8_2 = L8_2()
  if L8_2 == nil or L8_2 == "" then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = 1
  L10_2 = L1_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = sigattr_tail
    L13_2 = L13_2[L12_2]
    L13_2 = L13_2.attribute
    if L13_2 == 16386 then
      L14_2 = sigattr_tail
      L14_2 = L14_2[L12_2]
      L14_2 = L14_2.utf8p1
      L15_2 = sigattr_tail
      L15_2 = L15_2[L12_2]
      L15_2 = L15_2.utf8p2
      L17_2 = L14_2
      L16_2 = L14_2.match
      L18_2 = "[^>]*[\\/$]"
      L16_2 = L16_2(L17_2, L18_2)
      L18_2 = L15_2
      L17_2 = L15_2.match
      L19_2 = "[^>]*[\\/$]"
      L17_2 = L17_2(L18_2, L19_2)
      L19_2 = L14_2
      L18_2 = L14_2.match
      L20_2 = "%.[^/%.]+$"
      L18_2 = L18_2(L19_2, L20_2)
      L20_2 = L15_2
      L19_2 = L15_2.match
      L21_2 = "%.[^/%.]+$"
      L19_2 = L19_2(L20_2, L21_2)
      if L17_2 ~= nil and L16_2 ~= nil and L16_2 == L17_2 and L18_2 ~= nil and L19_2 ~= nil and L19_2 ~= L18_2 then
        L20_2 = L3_2[L14_2]
        if L20_2 == nil then
          L3_2[L14_2] = true
          L20_2 = isFileExtensionOfInterest
          L21_2 = L15_2
          L20_2 = L20_2(L21_2)
          if L20_2 then
            L20_2 = isKnownFileExtension
            L21_2 = L14_2
            L20_2 = L20_2(L21_2)
            if L20_2 == false then
              L20_2 = IsRansomwareProcessImagePathExtensionExcluded
              L21_2 = L8_2
              L22_2 = L18_2
              L20_2 = L20_2(L21_2, L22_2)
              if L20_2 == false then
                L20_2 = GetFileEntropy
                L21_2 = L14_2
                L20_2 = L20_2(L21_2)
                if L20_2 == nil then
                  L3_2[L14_2] = -1
                else
                  L3_2[L14_2] = L20_2
                  if 6 <= L20_2 then
                    L21_2 = bm
                    L21_2 = L21_2.add_related_file
                    L22_2 = L14_2
                    L21_2(L22_2)
                    if L18_2 ~= nil then
                      L21_2 = L2_2[L18_2]
                      if L21_2 == nil then
                        L6_2 = L6_2 + 1
                        L2_2[L18_2] = 1
                      else
                        L21_2 = L2_2[L18_2]
                        L21_2 = L21_2 + 1
                        L2_2[L18_2] = L21_2
                      end
                    end
                    L22_2 = L14_2
                    L21_2 = L14_2.match
                    L23_2 = "[^>]*[\\/$]"
                    L21_2 = L21_2(L22_2, L23_2)
                    if L21_2 ~= nil then
                      L22_2 = L4_2[L21_2]
                      if L22_2 == nil then
                        L7_2 = L7_2 + 1
                        L4_2[L21_2] = 1
                      else
                        L22_2 = L4_2[L21_2]
                        L22_2 = L22_2 + 1
                        L4_2[L21_2] = L22_2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if L6_2 == 0 then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = 0
  L10_2 = pairs
  L11_2 = L2_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  for L13_2, L14_2 in L10_2, L11_2, L12_2 do
    if L14_2 > L9_2 then
      L9_2 = L14_2
    end
  end
  if A0_2 == nil or A0_2 < 1 then
    A0_2 = 2
  end
  if L6_2 < 3 and 10 <= L9_2 and L7_2 >= A0_2 then
    L10_2 = addRelatedProcess
    L10_2()
    L10_2 = reportRelatedBmHits
    L10_2()
    L10_2 = safeJsonSerialize
    L11_2 = L3_2
    L10_2 = L10_2(L11_2)
    L11_2 = bm
    L11_2 = L11_2.add_related_string
    L12_2 = "file_metadata"
    L13_2 = L10_2
    L14_2 = bm
    L14_2 = L14_2.RelatedStringBMReport
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = mp
    L11_2 = L11_2.INFECTED
    return L11_2
  end
  L10_2 = mp
  L10_2 = L10_2.CLEAN
  return L10_2
end

analyzeRansomwarePattern2 = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = mp
  L0_2 = L0_2.SIGATTR_LOG_SZ
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = 50000000
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L8_2 = bm
  L8_2 = L8_2.GetSignatureMatchDuration
  L8_2 = L8_2()
  if L4_2 < L8_2 then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = IsProcessExcludedFromRansomwareAnalysis
  L8_2 = L8_2()
  if L8_2 == true then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = bm
  L8_2 = L8_2.get_current_process_startup_info
  L8_2 = L8_2()
  L9_2 = bm
  L9_2 = L9_2.get_imagepath
  L9_2 = L9_2()
  if L9_2 ~= nil and L9_2 ~= "" and L8_2 ~= nil then
    L10_2 = L8_2.ppid
    if L10_2 ~= nil then
      goto lbl_43
    end
  end
  L10_2 = mp
  L10_2 = L10_2.CLEAN
  do return L10_2 end
  ::lbl_43::
  L10_2 = string
  L10_2 = L10_2.find
  L11_2 = L9_2
  L12_2 = "/7za"
  L13_2 = -4
  L14_2 = true
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  if not L10_2 then
    L10_2 = string
    L10_2 = L10_2.find
    L11_2 = L9_2
    L12_2 = "/bin/tar"
    L13_2 = -8
    L14_2 = true
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    if not L10_2 then
      goto lbl_64
    end
  end
  L10_2 = mp
  L10_2 = L10_2.CLEAN
  do return L10_2 end
  ::lbl_64::
  L10_2 = 1
  L11_2 = L0_2
  L12_2 = 1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = sigattr_tail
    L14_2 = L14_2[L13_2]
    L14_2 = L14_2.attribute
    if L14_2 == 16384 then
      L15_2 = sigattr_tail
      L15_2 = L15_2[L13_2]
      L15_2 = L15_2.utf8p1
      L16_2 = L2_2[L15_2]
      if L16_2 == nil then
        L2_2[L15_2] = true
        L17_2 = L15_2
        L16_2 = L15_2.match
        L18_2 = "%.[^/%.]+$"
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 ~= nil then
          L17_2 = CheckFileExtnIncludeProcessId
          L18_2 = L8_2.ppid
          L19_2 = L16_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 then
            L17_2 = mp
            L17_2 = L17_2.CLEAN
            return L17_2
          end
        end
        L17_2 = isKnownFileExtension
        L18_2 = L15_2
        L17_2 = L17_2(L18_2)
        if L17_2 == false then
          L17_2 = IsRansomwareProcessImagePathExtensionExcluded
          L18_2 = L9_2
          L19_2 = L16_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 == false then
            L17_2 = bm
            L17_2 = L17_2.add_related_file
            L18_2 = L15_2
            L17_2(L18_2)
            if L16_2 ~= nil then
              L17_2 = L1_2[L16_2]
              if L17_2 == nil then
                L5_2 = L5_2 + 1
                L1_2[L16_2] = 1
              else
                L17_2 = L1_2[L16_2]
                L17_2 = L17_2 + 1
                L1_2[L16_2] = L17_2
              end
            end
            L18_2 = L15_2
            L17_2 = L15_2.match
            L19_2 = "[^>]*[\\/$]"
            L17_2 = L17_2(L18_2, L19_2)
            if L17_2 ~= nil then
              L18_2 = L3_2[L17_2]
              if L18_2 == nil then
                L6_2 = L6_2 + 1
                L3_2[L17_2] = 1
              else
                L18_2 = L3_2[L17_2]
                L18_2 = L18_2 + 1
                L3_2[L17_2] = L18_2
              end
            end
        end
        else
          L17_2 = isKnownFileExtension
          L18_2 = L15_2
          L17_2 = L17_2(L18_2)
          if L17_2 == true then
            L7_2 = L7_2 + 1
          end
        end
      end
    end
  end
  if 15 < L7_2 then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  L10_2 = 0
  L11_2 = pairs
  L12_2 = L1_2
  L11_2, L12_2, L13_2 = L11_2(L12_2)
  for L14_2, L15_2 in L11_2, L12_2, L13_2 do
    if L15_2 > L10_2 then
      L10_2 = L15_2
    end
  end
  if L5_2 == 0 or L6_2 == 1 and L10_2 < 10 then
    L11_2 = mp
    L11_2 = L11_2.CLEAN
    return L11_2
  end
  if L5_2 < 3 and (10 <= L10_2 and 3 <= L6_2 or 20 <= L10_2) then
    L11_2 = addRelatedProcess
    L11_2()
    L11_2 = reportRelatedBmHits
    L11_2()
    L11_2 = safeJsonSerialize
    L12_2 = L2_2
    L11_2 = L11_2(L12_2)
    L12_2 = bm
    L12_2 = L12_2.add_related_string
    L13_2 = "file_metadata"
    L14_2 = L11_2
    L15_2 = bm
    L15_2 = L15_2.RelatedStringBMReport
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = mp
    L12_2 = L12_2.INFECTED
    return L12_2
  end
  L11_2 = mp
  L11_2 = L11_2.CLEAN
  return L11_2
end

analyzeRansomwarePattern3 = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = 150000000
  L6_2 = 0
  L7_2 = 0
  L8_2 = bm
  L8_2 = L8_2.GetSignatureMatchDuration
  L8_2 = L8_2()
  if L5_2 < L8_2 then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = IsProcessExcludedFromRansomwareAnalysis
  L8_2 = L8_2()
  if L8_2 == true then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = bm
  L8_2 = L8_2.get_imagepath
  L8_2 = L8_2()
  if L8_2 == nil or L8_2 == "" then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = 1
  L10_2 = L1_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = sigattr_tail
    L13_2 = L13_2[L12_2]
    L13_2 = L13_2.attribute
    if L13_2 == 16386 then
      L14_2 = sigattr_tail
      L14_2 = L14_2[L12_2]
      L14_2 = L14_2.utf8p1
      L15_2 = sigattr_tail
      L15_2 = L15_2[L12_2]
      L15_2 = L15_2.utf8p2
      L17_2 = L14_2
      L16_2 = L14_2.match
      L18_2 = "[^>]*[\\/$]"
      L16_2 = L16_2(L17_2, L18_2)
      L18_2 = L15_2
      L17_2 = L15_2.match
      L19_2 = "[^>]*[\\/$]"
      L17_2 = L17_2(L18_2, L19_2)
      L19_2 = L14_2
      L18_2 = L14_2.match
      L20_2 = "%.[^/%.]+$"
      L18_2 = L18_2(L19_2, L20_2)
      L20_2 = L15_2
      L19_2 = L15_2.match
      L21_2 = "%.[^/%.]+$"
      L19_2 = L19_2(L20_2, L21_2)
      if L17_2 ~= nil and L16_2 ~= nil and L16_2 == L17_2 and L18_2 ~= nil and L19_2 ~= nil and L19_2 ~= L18_2 then
        L20_2 = isFileExtensionOfInterest
        L21_2 = L15_2
        L20_2 = L20_2(L21_2)
        if L20_2 then
          L20_2 = IsRansomwareProcessImagePathExtensionExcluded
          L21_2 = L8_2
          L22_2 = L18_2
          L20_2 = L20_2(L21_2, L22_2)
          if L20_2 == false then
            L20_2 = L3_2[L14_2]
            if L20_2 == nil then
              L20_2 = GetFileEntropy
              L21_2 = L14_2
              L20_2 = L20_2(L21_2)
              if L20_2 == nil then
                L3_2[L14_2] = -1
              else
                L3_2[L14_2] = L20_2
                if 6 <= L20_2 then
                  L21_2 = bm
                  L21_2 = L21_2.add_related_file
                  L22_2 = L14_2
                  L21_2(L22_2)
                  L21_2 = L2_2[L18_2]
                  if L21_2 == nil then
                    L6_2 = L6_2 + 1
                    L2_2[L18_2] = 1
                  else
                    L21_2 = L2_2[L18_2]
                    L21_2 = L21_2 + 1
                    L2_2[L18_2] = L21_2
                  end
                  L21_2 = L4_2[L16_2]
                  if L21_2 == nil then
                    L7_2 = L7_2 + 1
                    L4_2[L16_2] = 1
                  else
                    L21_2 = L4_2[L16_2]
                    L21_2 = L21_2 + 1
                    L4_2[L16_2] = L21_2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L9_2 = 0
  L10_2 = pairs
  L11_2 = L2_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  for L13_2, L14_2 in L10_2, L11_2, L12_2 do
    if L14_2 > L9_2 then
      L9_2 = L14_2
    end
  end
  if L6_2 == 0 or L7_2 == 1 and L9_2 < 15 then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  if A0_2 == nil or A0_2 < 1 then
    A0_2 = 2
  end
  if L6_2 < 3 and (15 <= L9_2 and L7_2 >= A0_2 or 20 <= L9_2) then
    L10_2 = addRelatedProcess
    L10_2()
    L10_2 = reportRelatedBmHits
    L10_2()
    L10_2 = safeJsonSerialize
    L11_2 = L3_2
    L10_2 = L10_2(L11_2)
    L11_2 = bm
    L11_2 = L11_2.add_related_string
    L12_2 = "file_metadata"
    L13_2 = L10_2
    L14_2 = bm
    L14_2 = L14_2.RelatedStringBMReport
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = mp
    L11_2 = L11_2.INFECTED
    return L11_2
  end
  L10_2 = mp
  L10_2 = L10_2.CLEAN
  return L10_2
end

analyzeRansomwarePattern4 = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = 3
  L5_2 = 2
  L6_2 = 15
  L7_2 = 10
  L8_2 = versioning
  L8_2 = L8_2.GetCloudBlockLevel
  L8_2 = L8_2()
  L8_2 = 4 <= L8_2
  if A0_2 == "NEW_FILE_CREATED" then
    L5_2 = 3
  elseif A0_2 == "FILE_RENAMED_WITH_UNIQUE_EXTN" then
    if L8_2 then
      L6_2 = 15
      L7_2 = 5
    end
  elseif A0_2 == "FILE_RENAMED_WITH_KNOWN_EXTN" then
    if L8_2 then
      L6_2 = 10
      L7_2 = 5
    else
      L6_2 = 20
      L7_2 = 15
    end
  end
  if A1_2 == 0 or A2_2 == 1 and A3_2 < L6_2 then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  if A1_2 < L4_2 and (A3_2 >= L7_2 and A2_2 >= L5_2 or A0_2 ~= "NEW_FILE_CREATED" and A3_2 >= L6_2) then
    L9_2 = mp
    L9_2 = L9_2.INFECTED
    return L9_2
  end
  L9_2 = mp
  L9_2 = L9_2.CLEAN
  return L9_2
end

AnalyzeFileModifiedStats = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L2_2 = mp
    L2_2 = L2_2.CLEAN
    return L2_2
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = 0
  L6_2 = 0
  L7_2 = 10
  if A1_2 ~= "NEW_FILE_CREATED" then
    L7_2 = 5
  end
  L8_2 = MpCommon
  L8_2 = L8_2.GetPersistContextCountNoPath
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if L7_2 > L8_2 then
    L9_2 = mp
    L9_2 = L9_2.CLEAN
    return L9_2
  end
  L9_2 = MpCommon
  L9_2 = L9_2.GetPersistContextNoPath
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  if L9_2 ~= nil then
    L10_2 = ipairs
    L11_2 = L9_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    for L13_2, L14_2 in L10_2, L11_2, L12_2 do
      L15_2 = L3_2[L14_2]
      if L15_2 == nil then
        L15_2 = GetFileEntropy
        L16_2 = L14_2
        L15_2 = L15_2(L16_2)
        if L15_2 == nil then
          L3_2[L14_2] = -1
        else
          L3_2[L14_2] = L15_2
          if 6 <= L15_2 then
            L17_2 = L14_2
            L16_2 = L14_2.match
            L18_2 = "%.[^/%.]+$"
            L16_2 = L16_2(L17_2, L18_2)
            L17_2 = bm
            L17_2 = L17_2.add_related_file
            L18_2 = L14_2
            L17_2(L18_2)
            if L16_2 ~= nil then
              L17_2 = L2_2[L16_2]
              if L17_2 == nil then
                L5_2 = L5_2 + 1
                L2_2[L16_2] = 1
              else
                L17_2 = L2_2[L16_2]
                L17_2 = L17_2 + 1
                L2_2[L16_2] = L17_2
              end
            end
            L18_2 = L14_2
            L17_2 = L14_2.match
            L19_2 = "[^>]*[\\/$]"
            L17_2 = L17_2(L18_2, L19_2)
            if L17_2 ~= nil then
              L18_2 = L4_2[L17_2]
              if L18_2 == nil then
                L6_2 = L6_2 + 1
                L4_2[L17_2] = 1
              else
                L18_2 = L4_2[L17_2]
                L18_2 = L18_2 + 1
                L4_2[L17_2] = L18_2
              end
            end
          end
        end
      end
    end
  end
  L10_2 = 0
  L11_2 = pairs
  L12_2 = L2_2
  L11_2, L12_2, L13_2 = L11_2(L12_2)
  for L14_2, L15_2 in L11_2, L12_2, L13_2 do
    if L15_2 > L10_2 then
      L10_2 = L15_2
    end
  end
  L11_2 = AnalyzeFileModifiedStats
  L12_2 = A1_2
  L13_2 = L5_2
  L14_2 = L6_2
  L15_2 = L10_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L12_2 = mp
  L12_2 = L12_2.INFECTED
  if L11_2 == L12_2 then
    L11_2 = addRelatedProcess
    L11_2()
    L11_2 = reportRelatedBmHits
    L11_2()
    L11_2 = safeJsonSerialize
    L12_2 = L3_2
    L11_2 = L11_2(L12_2)
    L12_2 = bm
    L12_2 = L12_2.add_related_string
    L13_2 = "file_metadata"
    L14_2 = L11_2
    L15_2 = bm
    L15_2 = L15_2.RelatedStringBMReport
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = bm
    L12_2 = L12_2.add_related_string
    L13_2 = "process_context"
    L14_2 = A0_2
    L15_2 = bm
    L15_2 = L15_2.RelatedStringBMReport
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = mp
    L12_2 = L12_2.INFECTED
    return L12_2
  end
  L11_2 = mp
  L11_2 = L11_2.CLEAN
  return L11_2
end

analyzeRansomwarePattern5 = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  if A0_2 ~= nil then
    L5_2 = #A0_2
    if not (L5_2 <= 0) then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 == "bm" then
    L5_2 = bm
    L5_2 = L5_2.get_current_process_startup_info
    L5_2 = L5_2()
    L5_2 = L5_2.ppid
    if L5_2 ~= nil then
      L6_2 = mp
      L6_2 = L6_2.GetProcessCommandLine
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      A0_2 = L6_2
      if not A0_2 then
        return
      end
      L6_2 = string
      L6_2 = L6_2.lower
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      A0_2 = L6_2
    end
  end
  L5_2 = get_filepaths_from_string
  L6_2 = A0_2
  L7_2 = nil
  L8_2 = true
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = A0_2
  L6_2 = A0_2.gmatch
  L8_2 = "[a-zA-Z]:\\[^%s]+"
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  for L9_2 in L6_2, L7_2, L8_2 do
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L5_2
    L12_2 = L9_2
    L10_2(L11_2, L12_2)
  end
  L7_2 = A0_2
  L6_2 = A0_2.gmatch
  L8_2 = "(['\"])([a-zA-Z]:\\.-)%1"
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L5_2
    L13_2 = L10_2
    L11_2(L12_2, L13_2)
  end
  if A3_2 ~= nil then
    L6_2 = mp
    L6_2 = L6_2.bitand
    L7_2 = A3_2
    L8_2 = 8
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 == 8 then
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = A0_2
      L8_2 = ","
      L9_2 = 1
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 then
        L6_2 = string
        L6_2 = L6_2.gsub
        L7_2 = A0_2
        L8_2 = ","
        L9_2 = ""
        L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
        if L7_2 <= 20 then
          L8_2 = string
          L8_2 = L8_2.gmatch
          L9_2 = A0_2
          L10_2 = "[^,]+"
          L8_2 = L8_2(L9_2, L10_2)
          L9_2 = L8_2
          L10_2 = nil
          L11_2 = nil
          for L12_2 in L9_2, L10_2, L11_2 do
            L13_2 = string
            L13_2 = L13_2.gsub
            L14_2 = L12_2
            L15_2 = "^%s+"
            L16_2 = ""
            L13_2 = L13_2(L14_2, L15_2, L16_2)
            L12_2 = L13_2
            L13_2 = string
            L13_2 = L13_2.gsub
            L14_2 = L12_2
            L15_2 = "%s+$"
            L16_2 = ""
            L13_2 = L13_2(L14_2, L15_2, L16_2)
            L12_2 = L13_2
            L13_2 = table
            L13_2 = L13_2.insert
            L14_2 = L5_2
            L15_2 = L12_2
            L13_2(L14_2, L15_2)
          end
        end
      end
    end
  end
  if L5_2 ~= nil then
    L6_2 = #L5_2
    if not (L6_2 <= 0) then
      goto lbl_120
    end
  end
  do return end
  ::lbl_120::
  L6_2 = type
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L7_2 = 4
  if A2_2 ~= nil then
    L7_2 = A2_2
  end
  L8_2 = {}
  L9_2 = ipairs
  L10_2 = L5_2
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
    if A3_2 ~= nil then
      L14_2 = mp
      L14_2 = L14_2.bitand
      L15_2 = A3_2
      L16_2 = 1
      L14_2 = L14_2(L15_2, L16_2)
      if L14_2 == 1 then
        L14_2 = mp
        L14_2 = L14_2.ContextualExpandEnvironmentVariables
        L15_2 = L13_2
        L14_2 = L14_2(L15_2)
        L13_2 = L14_2
      end
    end
    L14_2 = sysio
    L14_2 = L14_2.IsFileExists
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    if L14_2 then
      L14_2 = false
      if L6_2 == "table" then
        L15_2 = string
        L15_2 = L15_2.len
        L16_2 = L13_2
        L15_2 = L15_2(L16_2)
        if L7_2 < L15_2 then
          L15_2 = string
          L15_2 = L15_2.sub
          L16_2 = L13_2
          L17_2 = -L7_2
          L15_2 = L15_2(L16_2, L17_2)
          L16_2 = A1_2[L15_2]
          if L16_2 then
            L14_2 = true
          end
        end
      elseif L6_2 == "string" then
        L15_2 = string
        L15_2 = L15_2.len
        L16_2 = L13_2
        L15_2 = L15_2(L16_2)
        if L7_2 < L15_2 then
          L15_2 = string
          L15_2 = L15_2.find
          L16_2 = A1_2
          L17_2 = string
          L17_2 = L17_2.sub
          L18_2 = L13_2
          L19_2 = -L7_2
          L17_2 = L17_2(L18_2, L19_2)
          L18_2 = 1
          L19_2 = true
          L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
          if L15_2 then
            L14_2 = true
          end
        end
      else
        L14_2 = true
      end
      if L14_2 == true and A3_2 ~= nil then
        L15_2 = mp
        L15_2 = L15_2.bitand
        L16_2 = A3_2
        L17_2 = 16
        L15_2 = L15_2(L16_2, L17_2)
        if L15_2 == 16 then
          L14_2 = false
          L15_2 = -1
          L16_2 = -1
          L17_2 = MpCommon
          L17_2 = L17_2.GetPersistContext
          L18_2 = L13_2
          L17_2 = L17_2(L18_2)
          if L17_2 ~= nil then
            L18_2 = ipairs
            L19_2 = L17_2
            L18_2, L19_2, L20_2 = L18_2(L19_2)
            for L21_2, L22_2 in L18_2, L19_2, L20_2 do
              L23_2 = string
              L23_2 = L23_2.find
              L24_2 = L22_2
              L25_2 = "Age:"
              L26_2 = 1
              L27_2 = true
              L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2)
              if L23_2 ~= nil then
                L23_2 = tonumber
                L24_2 = string
                L24_2 = L24_2.match
                L25_2 = L22_2
                L26_2 = "^Age:([0-9]+)$"
                L24_2, L25_2, L26_2, L27_2 = L24_2(L25_2, L26_2)
                L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2)
                if L23_2 ~= nil and L15_2 < L23_2 then
                  L15_2 = L23_2
                end
              end
              L23_2 = string
              L23_2 = L23_2.find
              L24_2 = L22_2
              L25_2 = "Prevalence:"
              L26_2 = 1
              L27_2 = true
              L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2)
              if L23_2 ~= nil then
                L23_2 = tonumber
                L24_2 = string
                L24_2 = L24_2.match
                L25_2 = L22_2
                L26_2 = "^Prevalence:([0-9]+)$"
                L24_2, L25_2, L26_2, L27_2 = L24_2(L25_2, L26_2)
                L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2)
                if L23_2 ~= nil and L16_2 < L23_2 then
                  L16_2 = L23_2
                end
              end
            end
          end
          if -1 < L15_2 and L15_2 <= 1 and -1 < L16_2 and L16_2 <= 100 then
            L14_2 = true
          end
        end
      end
      if L14_2 == true and A3_2 ~= nil then
        L15_2 = mp
        L15_2 = L15_2.bitand
        L16_2 = A3_2
        L17_2 = 32
        L15_2 = L15_2(L16_2, L17_2)
        if L15_2 ~= 32 then
          L15_2 = mp
          L15_2 = L15_2.bitand
          L16_2 = A3_2
          L17_2 = 64
          L15_2 = L15_2(L16_2, L17_2)
          if L15_2 ~= 64 then
            goto lbl_329
          end
        end
        L14_2 = false
        if A4_2 ~= nil then
          L15_2 = type
          L16_2 = A4_2
          L15_2 = L15_2(L16_2)
          if L15_2 == "table" then
            L15_2 = true
            L16_2 = mp
            L16_2 = L16_2.bitand
            L17_2 = A3_2
            L18_2 = 64
            L16_2 = L16_2(L17_2, L18_2)
            if L16_2 == 64 then
              L15_2 = false
            end
            
            function L16_2(A0_3, A1_3)
              local L2_3, L3_3, L4_3, L5_3
              if A0_3 ~= nil then
                L2_3 = #A0_3
                if not (L2_3 <= 3) then
                  goto lbl_8
                end
              end
              L2_3 = false
              do return L2_3 end
              ::lbl_8::
              L2_3 = MpCommon
              L2_3 = L2_3.GetPersistContextCount
              L3_3 = A0_3
              L2_3 = L2_3(L3_3)
              if L2_3 == nil or L2_3 <= 0 then
                L3_3 = false
                return L3_3
              end
              L3_3 = MpCommon
              L3_3 = L3_3.QueryPersistContext
              L4_3 = A0_3
              L5_3 = A1_3
              L3_3 = L3_3(L4_3, L5_3)
              if L3_3 then
                L3_3 = true
                return L3_3
              end
              L3_3 = false
              return L3_3
            end
            
            L17_2 = ipairs
            L18_2 = A4_2
            L17_2, L18_2, L19_2 = L17_2(L18_2)
            for L20_2, L21_2 in L17_2, L18_2, L19_2 do
              L22_2 = L16_2
              L23_2 = L13_2
              L24_2 = L21_2
              L22_2 = L22_2(L23_2, L24_2)
              if L22_2 == true then
                L14_2 = true
                if L15_2 == false then
                  break
                end
              elseif L15_2 == true then
                L14_2 = false
                break
              end
            end
          end
        end
      end
      ::lbl_329::
      if L14_2 == true then
        if A3_2 ~= nil then
          L15_2 = mp
          L15_2 = L15_2.bitand
          L16_2 = A3_2
          L17_2 = 2
          L15_2 = L15_2(L16_2, L17_2)
          if L15_2 == 2 then
            L15_2 = mp
            L15_2 = L15_2.IsKnownFriendlyFile
            L16_2 = L13_2
            L17_2 = true
            L18_2 = true
            L15_2 = L15_2(L16_2, L17_2, L18_2)
            if L15_2 == nil or L15_2 == false then
              L16_2 = mp
              L16_2 = L16_2.bitand
              L17_2 = A3_2
              L18_2 = 4
              L16_2 = L16_2(L17_2, L18_2)
              if L16_2 == 4 then
                L16_2 = bm
                L16_2 = L16_2.add_threat_file
                L17_2 = L13_2
                L16_2(L17_2)
              else
                L16_2 = bm
                L16_2 = L16_2.add_related_file
                L17_2 = L13_2
                L16_2(L17_2)
              end
              L16_2 = table
              L16_2 = L16_2.insert
              L17_2 = L8_2
              L18_2 = L13_2
              L16_2(L17_2, L18_2)
            end
        end
        else
          if A3_2 ~= nil then
            L15_2 = mp
            L15_2 = L15_2.bitand
            L16_2 = A3_2
            L17_2 = 4
            L15_2 = L15_2(L16_2, L17_2)
            if L15_2 == 4 then
              L15_2 = bm
              L15_2 = L15_2.add_threat_file
              L16_2 = L13_2
              L15_2(L16_2)
              L15_2 = table
              L15_2 = L15_2.insert
              L16_2 = L8_2
              L17_2 = L13_2
              L15_2(L16_2, L17_2)
          end
          else
            L15_2 = bm
            L15_2 = L15_2.add_related_file
            L16_2 = L13_2
            L15_2(L16_2)
            L15_2 = table
            L15_2 = L15_2.insert
            L16_2 = L8_2
            L17_2 = L13_2
            L15_2(L16_2, L17_2)
          end
        end
      end
    end
  end
  L9_2 = #L8_2
  if 1 <= L9_2 then
    return L8_2
  end
  return
end

bm_AddRelatedFileFromCommandLine = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil or A0_2 == "" then
    L2_2 = nil
    return L2_2
  end
  L2_2 = sysio
  L2_2 = L2_2.IsFileExists
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == false then
    L2_2 = nil
    return L2_2
  end
  L2_2 = sysio
  L2_2 = L2_2.GetFileSize
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  if not (L2_2 < 65536) or not L2_2 then
    L2_2 = 65536
  end
  if not (A1_2 and A1_2 < L2_2) or not A1_2 then
    A1_2 = L2_2
  end
  L3_2 = sysio
  L3_2 = L3_2.ReadFile
  L4_2 = A0_2
  L5_2 = 0
  L6_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 == nil then
    L4_2 = nil
    return L4_2
  end
  L4_2 = crypto
  L4_2 = L4_2.ComputeEntropy
  L5_2 = L3_2
  return L4_2(L5_2)
end

GetFileEntropy = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "string" then
    L3_2 = false
    return L3_2
  end
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "nil" then
    A2_2 = true
  end
  if A2_2 ~= nil then
    L3_2 = type
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "boolean" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "string" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "string" then
    L3_2 = {}
    L4_2 = A1_2
    L3_2[1] = L4_2
    A1_2 = L3_2
  end
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if A2_2 then
      L9_2 = L7_2
      L8_2 = L7_2.lower
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2
      L9_2 = A0_2
      L8_2 = A0_2.lower
      L8_2 = L8_2(L9_2)
      A0_2 = L8_2
    end
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L11_2 = 1
    L12_2 = A2_2
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

contains = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "string" then
    L3_2 = false
    return L3_2
  end
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "nil" then
    A2_2 = true
  else
    L3_2 = type
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "boolean" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "string" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "string" then
    L3_2 = {}
    L4_2 = A1_2
    L3_2[1] = L4_2
    A1_2 = L3_2
  end
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = A0_2
    if A2_2 then
      L10_2 = L7_2
      L9_2 = L7_2.lower
      L9_2 = L9_2(L10_2)
      L7_2 = L9_2
      L10_2 = L8_2
      L9_2 = L8_2.lower
      L9_2 = L9_2(L10_2)
      L8_2 = L9_2
    end
    L9_2 = string
    L9_2 = L9_2.find
    L10_2 = L8_2
    L11_2 = L7_2
    L12_2 = 1
    L13_2 = A2_2
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    if not L9_2 then
      L9_2 = false
      return L9_2
    end
  end
  L3_2 = true
  return L3_2
end

containsall = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "string" then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      goto lbl_12
    end
  end
  do return A0_2 end
  ::lbl_12::
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == "string" then
      L7_2 = string
      L7_2 = L7_2.len
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 == 1 then
        L7_2 = string
        L7_2 = L7_2.gsub
        L8_2 = A0_2
        L9_2 = "'%s*%"
        L10_2 = L6_2
        L11_2 = "%s*'"
        L9_2 = L9_2 .. L10_2 .. L11_2
        L10_2 = ""
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        A0_2 = L7_2
        L7_2 = string
        L7_2 = L7_2.gsub
        L8_2 = A0_2
        L9_2 = "\"%s*%"
        L10_2 = L6_2
        L11_2 = "%s*\""
        L9_2 = L9_2 .. L10_2 .. L11_2
        L10_2 = ""
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        A0_2 = L7_2
      end
    end
  end
  return A0_2
end

RemoveStrConcat = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = A1_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "string" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "string" then
      goto lbl_13
    end
  end
  do return L2_2 end
  ::lbl_13::
  if A1_2 == "" then
    return L2_2
  end
  
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = ""
    L2_3 = ""
    L3_3 = 1
    L4_3 = 1
    while true do
      L5_3 = string
      L5_3 = L5_3.find
      L6_3 = A0_3
      L7_3 = "%[char%]%((%d+)%)"
      L8_3 = L4_3
      L5_3, L6_3, L7_3 = L5_3(L6_3, L7_3, L8_3)
      L2_3 = L7_3
      L4_3 = L6_3
      L3_3 = L5_3
      if not L3_3 then
        break
      end
      L5_3 = L1_3
      L6_3 = string
      L6_3 = L6_3.char
      L7_3 = tonumber
      L8_3 = L2_3
      L7_3, L8_3 = L7_3(L8_3)
      L6_3 = L6_3(L7_3, L8_3)
      L1_3 = L5_3 .. L6_3
    end
    L5_3 = L1_3 or L5_3
    if L1_3 == "" or not L1_3 then
      L5_3 = A0_3
    end
    return L5_3
  end
  
  if A0_2 == "cmd" then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A1_2
    L6_2 = "^"
    L7_2 = 1
    L8_2 = true
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if L4_2 then
      L4_2 = string
      L4_2 = L4_2.gsub
      L5_2 = A1_2
      L6_2 = "^"
      L7_2 = ""
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = string
      L5_2 = L5_2.gsub
      L6_2 = L4_2
      L7_2 = "%s+"
      L8_2 = " "
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L4_2 = L5_2
      L5_2 = string
      L5_2 = L5_2.lower
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
      L2_2 = L4_2
    end
  elseif A0_2 == "powershell" then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "`"
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.gsub
      L7_2 = L4_2
      L8_2 = "`"
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "\"\""
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.gsub
      L7_2 = L4_2
      L8_2 = "\"\""
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "\"+\""
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.gsub
      L7_2 = L4_2
      L8_2 = "\"%+\""
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "','"
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.gsub
      L7_2 = L4_2
      L8_2 = "'%,'"
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "'+'"
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = string
      L6_2 = L6_2.gsub
      L7_2 = L4_2
      L8_2 = "'%+'"
      L9_2 = ""
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "%[char%]%(%d+%)"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = L3_2
      L7_2 = L4_2
      L6_2 = L6_2(L7_2)
      L4_2 = L6_2
      L5_2 = true
    end
    L6_2 = string
    L6_2 = L6_2.match
    L7_2 = L4_2
    L8_2 = "[%-/][eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)"
    L6_2 = L6_2(L7_2, L8_2)
    if not L6_2 then
      L7_2 = string
      L7_2 = L7_2.match
      L8_2 = L4_2
      L9_2 = "\226\128\147[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)"
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L7_2
    end
    if L6_2 then
      L7_2 = MpCommon
      L7_2 = L7_2.Base64Decode
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        return L4_2
      end
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = "%z"
      L11_2 = ""
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.lower
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = "^%s+"
      L11_2 = ""
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = "%s+$"
      L11_2 = ""
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = "%s+"
      L11_2 = " "
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = "`"
      L11_2 = ""
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L8_2 = RemoveStrConcat
      L9_2 = L7_2
      L10_2 = {}
      L11_2 = "+"
      L10_2[1] = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2 = L8_2
      L8_2 = string
      L8_2 = L8_2.gsub
      L9_2 = L7_2
      L10_2 = " *, *"
      L11_2 = ","
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L7_2 = L8_2
      L2_2 = L7_2
    elseif L5_2 then
      L2_2 = L4_2
    end
  end
  return L2_2
end

NormalizeCmdline = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "table" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "number" then
      A1_2 = 1
    end
    L3_2 = "{"
    L4_2 = 0
    L5_2 = pairs
    L6_2 = A0_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2 in L5_2, L6_2, L7_2 do
      L4_2 = L4_2 + 1
    end
    L5_2 = 1
    L6_2 = pairs
    L7_2 = A0_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      L11_2 = L3_2
      L12_2 = "\n"
      L3_2 = L11_2 .. L12_2
      L11_2 = L3_2
      L12_2 = string
      L12_2 = L12_2.rep
      L13_2 = "   "
      L14_2 = A1_2
      L12_2 = L12_2(L13_2, L14_2)
      L3_2 = L11_2 .. L12_2
      L11_2 = type
      L12_2 = L9_2
      L11_2 = L11_2(L12_2)
      if L11_2 ~= "number" then
        L11_2 = "'"
        L12_2 = L9_2
        L13_2 = "'"
        L9_2 = L11_2 .. L12_2 .. L13_2
      end
      L11_2 = L3_2
      L12_2 = L9_2
      L13_2 = " = "
      L14_2 = DumpTable
      L15_2 = L10_2
      L16_2 = A1_2 + 1
      L14_2 = L14_2(L15_2, L16_2)
      L3_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
      if L4_2 > L5_2 then
        L11_2 = L3_2
        L12_2 = ", "
        L3_2 = L11_2 .. L12_2
      end
      L5_2 = L5_2 + 1
    end
    L6_2 = L3_2
    L7_2 = "\n"
    L3_2 = L6_2 .. L7_2
    L6_2 = L3_2
    L7_2 = string
    L7_2 = L7_2.rep
    L8_2 = "   "
    L9_2 = A1_2 - 1
    L7_2 = L7_2(L8_2, L9_2)
    L3_2 = L6_2 .. L7_2
    L6_2 = L3_2
    L7_2 = "}"
    L6_2 = L6_2 .. L7_2
    return L6_2
  elseif L2_2 == "string" then
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = A0_2
    L5_2 = "[\r\n]+"
    L6_2 = ""
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = "'"
    L5_2 = L3_2
    L6_2 = "'"
    L4_2 = L4_2 .. L5_2 .. L6_2
    return L4_2
  else
    if A0_2 == nil then
      A0_2 = "Empty_Table"
    end
    L3_2 = tostring
    L4_2 = A0_2
    return L3_2(L4_2)
  end
end

DumpTable = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = "yur"
  L5_2 = "tox"
  L6_2 = "how"
  L7_2 = "your"
  L8_2 = "motd"
  L9_2 = "more"
  L10_2 = "help"
  L11_2 = "desk"
  L12_2 = "where"
  L13_2 = "vault"
  L14_2 = "leame"
  L15_2 = "\230\150\135\228\187\182\232\167\163\229\175\134\229\184\174\229\138\169"
  L16_2 = "\208\191\208\176\209\128\208\190\208\187\209\140"
  L17_2 = "unlock"
  L18_2 = "ransom"
  L19_2 = "readme"
  L20_2 = "please"
  L21_2 = "locked"
  L22_2 = "warning"
  L23_2 = "restore"
  L24_2 = "recover"
  L25_2 = "rec0ver"
  L26_2 = "payment"
  L27_2 = "install"
  L28_2 = "h_e_l_p"
  L29_2 = "encrypt"
  L30_2 = "decrypt"
  L31_2 = "crjoker"
  L32_2 = "rarvault"
  L33_2 = "mensagem"
  L34_2 = "fs0ciety"
  L35_2 = "de-crypt"
  L36_2 = "criptoso"
  L37_2 = "beni oku"
  L38_2 = "_what_is"
  L39_2 = "zino_note"
  L40_2 = "wallpaper"
  L41_2 = "infection"
  L42_2 = "attention"
  L43_2 = "important!"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L3_2[12] = L15_2
  L3_2[13] = L16_2
  L3_2[14] = L17_2
  L3_2[15] = L18_2
  L3_2[16] = L19_2
  L3_2[17] = L20_2
  L3_2[18] = L21_2
  L3_2[19] = L22_2
  L3_2[20] = L23_2
  L3_2[21] = L24_2
  L3_2[22] = L25_2
  L3_2[23] = L26_2
  L3_2[24] = L27_2
  L3_2[25] = L28_2
  L3_2[26] = L29_2
  L3_2[27] = L30_2
  L3_2[28] = L31_2
  L3_2[29] = L32_2
  L3_2[30] = L33_2
  L3_2[31] = L34_2
  L3_2[32] = L35_2
  L3_2[33] = L36_2
  L3_2[34] = L37_2
  L3_2[35] = L38_2
  L3_2[36] = L39_2
  L3_2[37] = L40_2
  L3_2[38] = L41_2
  L3_2[39] = L42_2
  L3_2[40] = L43_2
  L2_2[0] = L3_2
  L3_2 = {}
  L4_2 = "files_back"
  L5_2 = "dummy_file"
  L6_2 = "decryptage"
  L7_2 = "dale_files"
  L8_2 = "chip_files"
  L9_2 = "\208\191\209\128\208\190\209\135\209\130\208\184_\208\188\208\181\208\189\209\157"
  L10_2 = "instruction"
  L11_2 = "getyoufiles"
  L12_2 = "enigma_encr"
  L13_2 = "_descifrado"
  L14_2 = "yougothacked"
  L15_2 = "shtodelatvam"
  L16_2 = "saving grace"
  L17_2 = "\228\189\160\231\154\132\230\170\148\230\161\136\232\162\171\230\136\145\229\128\145\229\138\160\229\175\134\229\149\166!!!"
  L18_2 = "thxforyurtyme"
  L19_2 = "desktoposiris"
  L20_2 = "buyunlockcode"
  L21_2 = "take_seriously"
  L22_2 = "me-enced-files"
  L23_2 = "instructionaga"
  L24_2 = "read-for-hellpp"
  L25_2 = "de_crypt_readme"
  L26_2 = "we-must-dec-files"
  L27_2 = "allfilesarelocked"
  L28_2 = "@_use_to_fix_jjny"
  L29_2 = "!!!!!aten\195\167\195\163o!!!!!"
  L30_2 = "try-read-me-to-dec"
  L31_2 = "desifrovani_pokyny"
  L32_2 = "leer_inmediatamente"
  L33_2 = "check-it-help-files"
  L34_2 = "sifre_cozme_talimati"
  L35_2 = "let-me-try-dec-files"
  L36_2 = "_files_are_encrypted"
  L37_2 = "whathappendtoyourfiles"
  L38_2 = "merry_i_love_you_bruce"
  L39_2 = "entschlusseln_hinweise"
  L40_2 = "no-problem-we-dec-files"
  L41_2 = "istruzioni_decrittazione"
  L42_2 = "\208\186\208\176\208\186 \209\128\208\176\209\157\209\136\208\184\209\132\209\128\208\190\208\178\208\176\209\130\209\140 \209\132\208\176\208\185\208\187\209\139!!!"
  L43_2 = "oksowathappendtoyourfiles"
  L44_2 = "000-if-you-want-dec-files"
  L45_2 = "ontsleutelings_instructies"
  L46_2 = "nomoreransom_note_original"
  L47_2 = "if_want_files_back_pls_read"
  L48_2 = "comment d\195\169bloquer mes fichiers"
  L49_2 = "recupere seus arquivos. leia-me!"
  L50_2 = "dosyalariniza ula\197\159mak \196\176\195\167\196\176n a\195\167iniz"
  L51_2 = "wie_zum_wiederherstellen_von_dateien"
  L52_2 = "_adatok_visszaallitasahoz_utasitasok"
  L53_2 = "como descriptografar os seus arquivos"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L3_2[12] = L15_2
  L3_2[13] = L16_2
  L3_2[14] = L17_2
  L3_2[15] = L18_2
  L3_2[16] = L19_2
  L3_2[17] = L20_2
  L3_2[18] = L21_2
  L3_2[19] = L22_2
  L3_2[20] = L23_2
  L3_2[21] = L24_2
  L3_2[22] = L25_2
  L3_2[23] = L26_2
  L3_2[24] = L27_2
  L3_2[25] = L28_2
  L3_2[26] = L29_2
  L3_2[27] = L30_2
  L3_2[28] = L31_2
  L3_2[29] = L32_2
  L3_2[30] = L33_2
  L3_2[31] = L34_2
  L3_2[32] = L35_2
  L3_2[33] = L36_2
  L3_2[34] = L37_2
  L3_2[35] = L38_2
  L3_2[36] = L39_2
  L3_2[37] = L40_2
  L3_2[38] = L41_2
  L3_2[39] = L42_2
  L3_2[40] = L43_2
  L3_2[41] = L44_2
  L3_2[42] = L45_2
  L3_2[43] = L46_2
  L3_2[44] = L47_2
  L3_2[45] = L48_2
  L3_2[46] = L49_2
  L3_2[47] = L50_2
  L3_2[48] = L51_2
  L3_2[49] = L52_2
  L3_2[50] = L53_2
  L2_2[1] = L3_2
  if A0_2 ~= nil and A0_2 ~= "" then
    L3_2 = L2_2[A1_2]
    if L3_2 ~= nil then
      goto lbl_107
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_107::
  L4_2 = A0_2
  L3_2 = A0_2.match
  L5_2 = "[^>](.-)([^\\/]-%.?([^%.\\/]*))$"
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  if L4_2 == nil then
    L6_2 = nil
    return L6_2
  end
  L6_2 = ipairs
  L7_2 = L2_2[A1_2]
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = string
    L11_2 = L11_2.find
    L13_2 = L4_2
    L12_2 = L4_2.lower
    L12_2 = L12_2(L13_2)
    L13_2 = L10_2
    L14_2 = 1
    L15_2 = true
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    if L11_2 then
      L11_2 = true
      return L11_2
    end
  end
  L6_2 = false
  return L6_2
end

isMatchedWithRansomNotePattern = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = A0_2
  L6_2 = "pid:(%w+),ProcessStart:(%w+)"
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= nil and L5_2 ~= nil then
    L6_2 = string
    L6_2 = L6_2.lower
    L7_2 = L4_2
    L8_2 = "_"
    L9_2 = L5_2
    L10_2 = "_"
    L11_2 = A1_2
    L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2 = L6_2(L7_2)
    if A3_2 == 0 then
      A3_2 = 3600
    end
    L7_2 = #A2_2
    if 0 < L7_2 then
      L7_2 = MpCommon
      L7_2 = L7_2.SetPersistContextNoPath
      L8_2 = L6_2
      L9_2 = A2_2
      L10_2 = A3_2
      L7_2(L8_2, L9_2, L10_2)
    end
  end
end

setPersistContextNoPathForPid = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    return
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "pid:(%w+),ProcessStart:(%w+)"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 ~= nil and L3_2 ~= nil then
    L4_2 = string
    L4_2 = L4_2.lower
    L5_2 = L2_2
    L6_2 = "_"
    L7_2 = L3_2
    L8_2 = "_"
    L9_2 = A1_2
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    L4_2 = L4_2(L5_2)
    L5_2 = MpCommon
    L5_2 = L5_2.GetPersistContextCountNoPath
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if 0 < L5_2 then
      L5_2 = MpCommon
      L5_2 = L5_2.GetPersistContextNoPath
      L6_2 = L4_2
      return L5_2(L6_2)
    end
  end
end

getPersistContextNoPathForPid = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  L2_2 = {}
  L3_2 = 180
  if A0_2 == nil then
    L4_2 = mp
    L4_2 = L4_2.CLEAN
    return L4_2
  end
  L4_2 = "ransom_note_pattern_"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L5_2 = bm
  L5_2 = L5_2.get_current_process_startup_info
  L5_2 = L5_2()
  if L5_2 == nil then
    L6_2 = mp
    L6_2 = L6_2.CLEAN
    return L6_2
  end
  L6_2 = L5_2.ppid
  if L6_2 == nil or L6_2 == "" then
    L7_2 = mp
    L7_2 = L7_2.CLEAN
    return L7_2
  end
  L7_2 = IsProcessExcludedFromRansomwareAnalysis
  L7_2 = L7_2()
  if L7_2 == true then
    L7_2 = mp
    L7_2 = L7_2.CLEAN
    return L7_2
  end
  L7_2 = 1
  L8_2 = L1_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = sigattr_tail
    L11_2 = L11_2[L10_2]
    L11_2 = L11_2.attribute
    if L11_2 == 16384 then
      L12_2 = sigattr_tail
      L12_2 = L12_2[L10_2]
      L12_2 = L12_2.utf8p1
      if L12_2 == nil or L12_2 == "" then
        L13_2 = mp
        L13_2 = L13_2.CLEAN
        return L13_2
      end
      L13_2 = L2_2[L12_2]
      if L13_2 == nil then
        L2_2[L12_2] = true
        L13_2 = isMatchedWithRansomNotePattern
        L14_2 = L12_2
        L15_2 = A0_2
        L13_2 = L13_2(L14_2, L15_2)
        if L13_2 == true then
          L13_2 = setPersistContextNoPathForPid
          L14_2 = L6_2
          L15_2 = L4_2
          L16_2 = {}
          L17_2 = L12_2
          L16_2[1] = L17_2
          L17_2 = L3_2
          L13_2(L14_2, L15_2, L16_2, L17_2)
        else
          L13_2 = mp
          L13_2 = L13_2.CLEAN
          return L13_2
        end
      end
    end
  end
  L7_2 = {}
  L8_2 = getPersistContextNoPathForPid
  L9_2 = L6_2
  L10_2 = L4_2
  L8_2 = L8_2(L9_2, L10_2)
  if L8_2 ~= nil then
    L9_2 = ipairs
    L10_2 = L8_2
    L9_2, L10_2, L11_2 = L9_2(L10_2)
    for L12_2, L13_2 in L9_2, L10_2, L11_2 do
      L14_2 = bm
      L14_2 = L14_2.add_related_file
      L15_2 = L13_2
      L14_2(L15_2)
      L15_2 = L13_2
      L14_2 = L13_2.match
      L16_2 = "[^>](.-)([^\\/]-%.?([^%.\\/]*))$"
      L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
      if L14_2 ~= nil and L15_2 ~= nil then
        L17_2 = L7_2[L15_2]
        if not L17_2 then
          L17_2 = {}
          L7_2[L15_2] = L17_2
        end
        L17_2 = L7_2[L15_2]
        L17_2 = L17_2[L14_2]
        if not L17_2 then
          L17_2 = L7_2[L15_2]
          L17_2[L14_2] = true
        end
        L17_2 = 0
        L18_2 = pairs
        L19_2 = L7_2[L15_2]
        L18_2, L19_2, L20_2 = L18_2(L19_2)
        for L21_2 in L18_2, L19_2, L20_2 do
          L17_2 = L17_2 + 1
        end
        if 5 <= L17_2 then
          L18_2 = reportRelatedBmHits
          L18_2()
          L18_2 = addRelatedProcess
          L18_2()
          L18_2 = bm
          L18_2 = L18_2.add_related_string
          L19_2 = "file_metadata"
          L20_2 = L15_2
          L21_2 = bm
          L21_2 = L21_2.RelatedStringBMReport
          L18_2(L19_2, L20_2, L21_2)
          L18_2 = mp
          L18_2 = L18_2.INFECTED
          return L18_2
        end
      end
    end
  end
  L9_2 = mp
  L9_2 = L9_2.CLEAN
  return L9_2
end

analyzeRansomNotePattern = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = 60
  if A0_2 == nil then
    L3_2 = mp
    L3_2 = L3_2.CLEAN
    return L3_2
  end
  L3_2 = "esxcli_pattern_ctx"
  L4_2 = MpCommon
  L4_2 = L4_2.GetPersistContextCountNoPath
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if 0 < L4_2 then
    L4_2 = MpCommon
    L4_2 = L4_2.GetPersistContextNoPath
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L5_2 = 1
    if L4_2 ~= nil then
      L6_2 = ipairs
      L7_2 = L4_2
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      for L9_2, L10_2 in L6_2, L7_2, L8_2 do
        L11_2 = bm
        L11_2 = L11_2.add_related_string
        L12_2 = "escxli_cmd"
        L13_2 = L10_2
        L14_2 = bm
        L14_2 = L14_2.RelatedStringBMReport
        L11_2(L12_2, L13_2, L14_2)
        L5_2 = L5_2 + 1
        if 3 <= L5_2 then
          L11_2 = reportRelatedBmHits
          L11_2()
          L11_2 = addRelatedProcess
          L11_2()
          L11_2 = mp
          L11_2 = L11_2.INFECTED
          return L11_2
        end
      end
    end
  else
    L4_2 = MpCommon
    L4_2 = L4_2.SetPersistContextNoPath
    L5_2 = L3_2
    L6_2 = {}
    L7_2 = A0_2
    L6_2[1] = L7_2
    L7_2 = L2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = bm
    L4_2 = L4_2.add_related_string
    L5_2 = "escxli_cmd"
    L6_2 = A0_2
    L7_2 = bm
    L7_2 = L7_2.RelatedStringBMReport
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = mp
  L4_2 = L4_2.CLEAN
  return L4_2
end

analyzeEsxcliProcessPattern = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "string" then
    return
  end
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "([^\\]+)$"
  L2_2 = L2_2(L3_2, L4_2)
  if A1_2 == false then
    return L2_2
  end
  L4_2 = L2_2
  L3_2 = L2_2.lower
  return L3_2(L4_2)
end

GetFileName = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "table" then
    return
  end
  L2_2 = next
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and A1_2 ~= nil then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      goto lbl_23
    end
  end
  L2_2 = {}
  L2_2.min = 0
  L2_2.max = 1
  A1_2 = L2_2
  ::lbl_23::
  if A1_2 ~= nil then
    L2_2 = type
    L3_2 = A1_2.min
    L2_2 = L2_2(L3_2)
    if L2_2 == "number" then
      L2_2 = type
      L3_2 = A1_2.max
      L2_2 = L2_2(L3_2)
      if L2_2 == "number" then
        L2_2 = A1_2.min
        L3_2 = A1_2.max
        if L2_2 <= L3_2 then
          goto lbl_40
        end
      end
    end
    return
  end
  ::lbl_40::
  L2_2 = {}
  L3_2 = {}
  L3_2.id = "EMAILCLIENT"
  L2_2.outlook = L3_2
  L3_2 = {}
  L3_2.id = "EMAILCLIENT"
  L2_2.thunderbird = L3_2
  L3_2 = {}
  L3_2.id = "EMAILCLIENT"
  L2_2.wlmail = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.edge = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.msedge = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.iexplore = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.chrome = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.firefox = L3_2
  L3_2 = {}
  L3_2.id = "BROWSER"
  L2_2.opera = L3_2
  L3_2 = {}
  L3_2.id = "OFFICE"
  L2_2.winword = L3_2
  L3_2 = {}
  L3_2.id = "OFFICE"
  L2_2.excel = L3_2
  L3_2 = {}
  L3_2.id = "OFFICE"
  L2_2.powerpnt = L3_2
  L3_2 = {}
  L3_2.id = "OFFICE"
  L2_2.mspub = L3_2
  L3_2 = {}
  L3_2.id = "SCRIPTENG"
  L2_2.wscript = L3_2
  L3_2 = {}
  L3_2.id = "SCRIPTENG"
  L2_2.cscript = L3_2
  L3_2 = {}
  L3_2.id = "SCRIPTENG"
  L2_2.mshta = L3_2
  L3_2 = {}
  L3_2.id = "SCRIPTENG"
  L2_2.powershell = L3_2
  L3_2 = {}
  L3_2.id = "SCRIPTENG"
  L2_2.pwsh = L3_2
  L3_2 = {}
  L3_2.id = "JAVA"
  L2_2.java = L3_2
  L3_2 = {}
  L3_2.id = "JAVA"
  L2_2.javaw = L3_2
  L3_2 = {}
  L3_2.id = "JAVA"
  L2_2.javaws = L3_2
  L3_2 = {}
  L3_2.id = "MSI"
  L2_2.msiexec = L3_2
  L3_2 = {}
  L3_2.id = "WMI"
  L2_2.wmiprvse = L3_2
  L3_2 = {}
  L3_2.id = "WMI"
  L2_2.wmic = L3_2
  L3_2 = {}
  L3_2.id = "CMD"
  L2_2.cmd = L3_2
  L3_2 = {}
  L3_2.id = "RUNDLL"
  L2_2.rundll32 = L3_2
  L3_2 = {}
  L3_2.id = "REGSVR32"
  L2_2.regsvr32 = L3_2
  L3_2 = {}
  L3_2.id = "REGUTIL"
  L2_2.reg = L3_2
  L3_2 = {}
  L3_2.id = "WABMIG"
  L2_2.wabmig = L3_2
  L3_2 = {}
  L4_2 = add_parents
  L5_2 = nil
  L6_2 = A1_2.max
  L7_2 = nil
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L4_2
  L4_2 = next
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil then
    return
  end
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = L9_2.image_path
    if L10_2 ~= nil then
      L10_2 = GetFileName
      L11_2 = L9_2.image_path
      L10_2 = L10_2(L11_2)
      L11_2 = L10_2
      L10_2 = L10_2.gsub
      L12_2 = ".exe$"
      L13_2 = ""
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L11_2 = L2_2[L10_2]
      if L11_2 ~= nil then
        L12_2 = L11_2.id
        if L12_2 ~= nil then
          L12_2 = ipairs
          L13_2 = A0_2
          L12_2, L13_2, L14_2 = L12_2(L13_2)
          for L15_2, L16_2 in L12_2, L13_2, L14_2 do
            L17_2 = L11_2.id
            if L16_2 == L17_2 then
              L17_2 = A1_2.min
              if L8_2 >= L17_2 then
                L17_2 = A1_2.max
                if L8_2 <= L17_2 then
                  L17_2 = L11_2.id
                  L4_2[L8_2] = L17_2
                end
              end
            end
          end
        end
      end
    end
  end
  L5_2 = next
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil then
    L5_2 = false
    return L5_2
  end
  return L4_2
end

QueryProcContext = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = nil
    return L1_2
  end
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextNoPath
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = L1_2[L5_2]
    L8_2 = 1
    L9_2 = 1
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 == "." then
      L6_2 = L1_2[L5_2]
      return L6_2
    end
  end
  L2_2 = nil
  return L2_2
end

GetExtensionFromGenericRansomContext = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = "\".ccryptor\".darkside\".ecrypt\".crypt\".readme_to_restore\".kimcilware\".lilocked\".encrypted\".pysa\".rhkrc\".qoxaq\".naixq\".7rspj\".redrum\".grinch\".thanos\".21k5p\".ryk\".shutdown57\".gnncry\".itssoeasy\"._locked\".akira\".avos\".avos2\".avos2j\".avoslinux\".avos2j\".ifire\".kitty\".basta\".blackbyte\".blacksuit\".cerber\".cerber2\".cerber3\".conti\".cryptolocker\".coaq\".cosakos\".cuba\".cymcrypt\".dark_power\".devil\".dharma\".eight\".encryptedyourfiles\".enigma\".everest\".fargo\".foty\".fs0ciety\".gatz\".gazprom\".hack0\".itlock3\".itlock4\".jyos\".karma\".kigatsu\".kitz\".l0cked\".lockbit\".locky\".mallox\".malox\".medusa\".met@n\".neqp\".niwm\".nokonoko\".nokoyawa\".pandora\".play\".proton\".qotr\".quantum\".ranzylocked\".rook\".royal\".royal_w\".royal_u\".rsnslocked\".shino\".thor\".tury\".venus\".v-society\".weon\".wikon\".wncry\".wncryt\".zatp\".zepto\".slnya\"._locked\".akira\".avdn\".avos\".avos2\".babuk2\".basta\".blackbyte\".blacksuit\".babyk\".cerber\".cerber2\".cerber3\".ciop\".c_i0p\".cryptolocker\".coaq\".cosakos\".cuba\".cymcrypt\".dark_power\".devil\".dharma\".eight\".encryptedyourfiles\".enigma\".everest\".fargo\".foty\".fs0ciety\".gatz\".gazprom\".hack0\".itlock3\".itlock4\".jyos\".karma\".kigatsu\".kitz\".l0cked\".lockbit\".locky\".mallox\".malox\".medusa\".met@n\".neqp\".niwm\".nokonoko\".nokoyawa\".pandora\".play\".proton\".qotr\".quantum\".ranzylocked\".rook\".royal\".royal_w\".rsnslocked\".shino\".thor\".tury\".venus\".v-society\".weon\".wikon\".wncry\".wncryt\".zatp\".zepto\".rhysida\".nukrypt\".__nist_k571__\".73i87a\".7h9r\".8base\".8lock8\".___xratteamlucked\".__airacropencrypted!\"._airacropencrypted\".a5zfn\".abyss\".aes256\".aesir\".alcatraz\".amba\".angelamerkel\".angleware\".antihacker2017\".ap19\".barrax\".bart\".better_call_saul\".bianlian\".bitstak\".blackbit\".blackbytent\".blackrock\".bleepyourfiles\".bloc\".blocatto\".bluesky\".braincrypt\".breaking_bad\".bript\".btc-help-you\".btcbtcbtc\".btcware\".cccrrrppp\".chifrator@qq_com\".ci0p\".cifgksaffsfyghd\".cl0p\".clop\".comrade\".coverton\".crab\".crashed\".crime\".crinf\".criptiko\".criptokod\".cripttt\".crjoker\".crptrgr\".crptxxx\".crrrt\".cryeye\".cryp1\".crypt12\".crypt38\".crypte\".crypted\".crypted_file\".crypto\".cryptoshield\".cryptotorlocker2015!\".cryptowall\".cryptz\".crypz\".crysis\".cts0\".cts1\".cts2\".cts3\".cts4\".cts5\".cts6\".cts7\".cts8\".cts9\".cyber\".czvxce\".d0nut\".d4nk\".da_vinci_code\".dagoned\".dale\".damage\".darkbit\".darkness\".dcrypt\".decrypt2017\".ded\".deria\".disappeared\".domino\".doomed\".dxxd\".dyatel@qq_com\".edgel\".eking\".elbie\".encedrsa\".enciphered\".encmywork\".encoderpass\".encrypted_by_lltp\".encrypted_by_lltpp\".encryptedaes\".encryptedrsa\".evillock\".exotic\".fantom\".fargo3\".faust\".fear\".fenixiloveyou!!\".file0locked\".fileiscryptedhard\".filock\".firecrypt\".flocked\".fog\".frtrss\".fuck\".fucked\".fuckyourdata\".fun\".gaza\".gefickt\".genesis15\".gruzin@qq_com\".h3ll\".ha3\".hannah\".hb15\".helpdecrypt@ukr.net\".helpmeencedfiles\".herbst\".hnumkhotep\".hush\".iaufkakfhsaraf\".ifuckedyou\".inc\".infected\".isis\".iwanthelpuuu\".justbtcwillhelpyou\".kencf\".keyh0les\".keyz\".killedxxx\".kimcilware\".kirked\".korrektor\".kostya\".kr3\".kraken\".kratos\".lambda_l0cked\".lcked\".lechiffre\".legion\".lesli\".letmetrydecfiles\".licked\".limpopo\".lock93\".locked-by-mafia\".locklock\".lol!\".lorenz.sz40\".lovewindows\".madebyadam\".magic\".makop\".maktub\".maya\".merry\".micro\".mole\".mrcr1\".nalog@qq_com\".nemo-hacks.at.sigaint.org\".nevada\".no_more_ransom\".nochance\".noproblemwedecfiles\".notfoundrans\".nuclear55\".odcodc\".odin\".omg!\".onion\".only-we_can_help_you\".oops\".openforyou@india.com\".oplata@qq_com\".oshit\".osiris\".otherinformation\".p5tkjw\".padcrypt\".paybtcs\".paym\".paymrss\".payms\".paymst\".paymts\".payransom\".payrms\".payrmts\".pr0tect\".paytounlock\".payuranson\".pegs\".pizda@qq_com\".poar2w\".poop\".porno\".potato\".powerfulldecrypt\".pubg\".purge\".puuuk\".radamant\".rare1\".razy\".rdmk\".redkrypt\".rekt\".relock@qq_com\".remind\".revenge\".rmcm1\".rnsmwr\".rokku\".rsplited\".sage\".sanction\".securecrypted\".serpent\".sexy\".shit\".sifreli\".silent\".snake\".spora\".stn\".surprise\".sz40\".tent\".thetrumplockerf\".thetrumplockerfp\".theworldisyours\".threeamtime\".tkoinprz\".toxcrypt\".troyancoder@qq_com\".trun\".tzu\".uk-dealer@sigaint.org\".unavailable\".unlockvt@india.com\".v-s0ciety\".v1ceso0ciety\".vbransom\".velikasrbija\".vendetta\".vendetta2\".venusf\".venusp\".versiegelt\".vforvendetta\".vicesociety\".vindows\".vscrypt\".vsociety\".vxlock\".wallet\".wcry\".weareyourfriends\".weencedufiles\".wflx\".whereisyourfiles\".wisz\".yourransom\".z81928819\".safepay\".zc3791\".zcrypt\".zino\".zorro\".zxz\".zyklon\".8baselocked\".hunter\".lynx\".lockedttx\".x2anylock\".dlock\".nilson\".int3r1ock\".nitrogen\".4rc3twm\".encrypted.lock\""
  if A0_2 == nil or A0_2 == "" then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = A0_2
  L4_2 = 1
  L5_2 = 1
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 ~= "." then
    L2_2 = false
    return L2_2
  end
  L2_2 = "\""
  L3_2 = A0_2
  L4_2 = "\""
  A0_2 = L2_2 .. L3_2 .. L4_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

isKnownRansomExtension = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = false
    return L1_2
  end
  L1_2 = {}
  L2_2 = "/var/spool/exim4/"
  L3_2 = "/var/log/exim/"
  L4_2 = "/etc/apache2/"
  L5_2 = "/var/log/apache2/"
  L6_2 = "/var/www/"
  L7_2 = "/data/www/"
  L8_2 = "/etc/nginx/"
  L9_2 = "public_html/"
  L10_2 = "/srv/www/"
  L11_2 = "/etc/httpd/"
  L12_2 = "/srv/http/"
  L13_2 = "/var/lib/redis/"
  L14_2 = "/var/opt/redislabs/"
  L15_2 = "/data/db/"
  L16_2 = "/var/db/"
  L17_2 = "/.git/"
  L18_2 = "/.svn/"
  L19_2 = "/usr/share/nginx"
  L20_2 = "/vmfs/volumes/"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L1_2[12] = L13_2
  L1_2[13] = L14_2
  L1_2[14] = L15_2
  L1_2[15] = L16_2
  L1_2[16] = L17_2
  L1_2[17] = L18_2
  L1_2[18] = L19_2
  L1_2[19] = L20_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 ~= nil then
      L7_2 = string
      L7_2 = L7_2.find
      L8_2 = A0_2
      L9_2 = L6_2
      L10_2 = 1
      L11_2 = true
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
      if L7_2 then
        L7_2 = true
        return L7_2
      end
    end
  end
  L2_2 = false
  return L2_2
end

IsPathIncludedLinuxRansomCheck = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = {}
  L1_2 = bm
  L1_2 = L1_2.get_current_process_startup_info
  L1_2 = L1_2()
  L2_2 = MpCommon
  L2_2 = L2_2.GetCurrentTimeT
  L2_2 = L2_2()
  L0_2.current_time = L2_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = L1_2.ppid
  L4_2 = "pid:(%w+),ProcessStart:(%w+)"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = nil
  L5_2 = nil
  L6_2 = false
  L7_2 = bm
  L7_2 = L7_2.get_imagepath
  L7_2 = L7_2()
  L4_2 = L7_2
  if L4_2 ~= nil then
    L8_2 = L4_2
    L7_2 = L4_2.lower
    L7_2 = L7_2(L8_2)
    L4_2 = L7_2
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.PathToWin32Path
    L9_2 = L4_2
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    L4_2 = L8_2
    L6_2 = L7_2
    if L6_2 and L4_2 ~= nil then
      L7_2 = pcall
      L8_2 = sysio
      L8_2 = L8_2.GetFileLastWriteTime
      L9_2 = L4_2
      L7_2, L8_2 = L7_2(L8_2, L9_2)
      L5_2 = L8_2
      L6_2 = L7_2
      if L6_2 and L5_2 then
        L7_2 = L5_2 / 10000000
        L5_2 = L7_2 - 11644473600
      end
    end
  end
  L0_2.pid = L2_2
  L0_2.last_write_time = L5_2
  L7_2 = tonumber
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 / 10000000
  L7_2 = L7_2 - 11644473600
  L0_2.startTime = L7_2
  L7_2 = L0_2.current_time
  L8_2 = L0_2.startTime
  L7_2 = L7_2 - L8_2
  L0_2.time_delta = L7_2
  L7_2 = bm
  L7_2 = L7_2.get_sig_count
  L7_2 = L7_2()
  L0_2.sig_count = L7_2
  L7_2 = bm
  L7_2 = L7_2.add_related_string
  L8_2 = "timing"
  L9_2 = safeJsonSerialize
  L10_2 = L0_2
  L9_2 = L9_2(L10_2)
  L10_2 = bm
  L10_2 = L10_2.RelatedStringBMReport
  L7_2(L8_2, L9_2, L10_2)
  return L0_2
end

reportTimingData = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = "/usr/libexec/plistbuddy"
  L4_2 = "/usr/sbin/sshd"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 ~= nil then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = L1_2
      L10_2 = L7_2
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 == 1 then
        L8_2 = false
        return L8_2
      end
    end
  end
  L3_2 = {}
  L4_2 = "/system/"
  L5_2 = "/library/apple/"
  L6_2 = "/usr/local/jamf/bin/jamf"
  L7_2 = "/library/application support/microsoft/"
  L8_2 = "/sbin/launchd"
  L9_2 = "/usr/libexec/"
  L10_2 = "/usr/sbin/"
  L11_2 = "/sbin/"
  L12_2 = "/library/developer/privateframeworks/"
  L13_2 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
  L14_2 = "/applications/google chrome.app/contents/macos/google chrome"
  L15_2 = "/opt/homebrew/library/homebrew"
  L16_2 = "/applications/company portal.app/"
  L17_2 = "/applications/brave browser.app/contents/macos/"
  L18_2 = "/usr/local/libexec/amazon-ena-ethernet"
  L19_2 = "/applications/utilities/adobe creative cloud experience/"
  L20_2 = "/library/intune/microsoft intune agent.app/"
  L21_2 = "/applications/microsoft defender.app/"
  L22_2 = "/applications/microsoft powerpoint.app/"
  L23_2 = "/opt/aws/ssm/bin/amazon-ssm-agent"
  L24_2 = "/opt/aws/ssm/bin/ssm-agent-worker"
  L25_2 = "/opt/aws/ssm/bin/ssm-document-worker"
  L26_2 = "/opt/aws/ssm/update/amazon-ssm-agent-updater"
  L27_2 = "/private/var/log/amazon/ssm/"
  L28_2 = "/usr/local/libexec/ec2-macos-init"
  L29_2 = "/applications/globalprotect.app/contents/resources"
  L30_2 = "/applications/onedrive.app/contents/standaloneupdater.app/contents/macos/onedrivestandaloneupdater"
  L31_2 = "/library/application support/adobe/adobegcclient/adobegcclient.app/contents/macos/adobegcclient"
  L32_2 = "/library/application support/adobe/adobe desktop common/lcc/adobe_licensing_helper.app/contents/macos/adobe_licensing_helper"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L3_2[12] = L15_2
  L3_2[13] = L16_2
  L3_2[14] = L17_2
  L3_2[15] = L18_2
  L3_2[16] = L19_2
  L3_2[17] = L20_2
  L3_2[18] = L21_2
  L3_2[19] = L22_2
  L3_2[20] = L23_2
  L3_2[21] = L24_2
  L3_2[22] = L25_2
  L3_2[23] = L26_2
  L3_2[24] = L27_2
  L3_2[25] = L28_2
  L3_2[26] = L29_2
  L3_2[27] = L30_2
  L3_2[28] = L31_2
  L3_2[29] = L32_2
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    if L8_2 ~= nil then
      L9_2 = string
      L9_2 = L9_2.find
      L10_2 = L1_2
      L11_2 = L8_2
      L12_2 = 1
      L13_2 = true
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
      if L9_2 == 1 then
        L9_2 = true
        return L9_2
      end
    end
  end
  L4_2 = false
  return L4_2
end

IsExcludedByImagePathMacOS = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L1_2 = IsExcludedByImagePathMacOS
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = ".dylib"
  L4_2 = -6
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = A0_2
    L3_2 = ".so"
    L4_2 = -3
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = A0_2
      L3_2 = "__python_generated_allocator_preload"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = A0_2
        L3_2 = "/private/tmp/strip%.[^/]+$"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = "/private/tmp/bitcode_strip%.[^/]+$"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L1_2 = string
            L1_2 = L1_2.find
            L2_2 = A0_2
            L3_2 = "PPRiskMagnes.framework/PPRiskMagnes$"
            L4_2 = 1
            L5_2 = false
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L1_2 = string
              L1_2 = L1_2.find
              L2_2 = A0_2
              L3_2 = "/private/tmp/_MEI.*/Python3$"
              L4_2 = 1
              L5_2 = false
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = A0_2
                L3_2 = "/private/tmp/_MEI.*[^/]+/Python$"
                L4_2 = 1
                L5_2 = false
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if not L1_2 then
                  L1_2 = string
                  L1_2 = L1_2.find
                  L2_2 = A0_2
                  L3_2 = "/private/tmp/br%w%w%w%w%w%w$"
                  L4_2 = 1
                  L5_2 = false
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if not L1_2 then
                    L1_2 = string
                    L1_2 = L1_2.find
                    L2_2 = A0_2
                    L3_2 = "/private/tmp/PKInstallSandbox.*/tmp/br%w%w%w%w%w%w$"
                    L4_2 = 1
                    L5_2 = false
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if not L1_2 then
                      L1_2 = string
                      L1_2 = L1_2.find
                      L2_2 = A0_2
                      L3_2 = "/private/tmp/mcs/runner"
                      L4_2 = 1
                      L5_2 = true
                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                      if not L1_2 then
                        L1_2 = string
                        L1_2 = L1_2.find
                        L2_2 = A0_2
                        L3_2 = "/private/tmp/mcs/assets/"
                        L4_2 = 1
                        L5_2 = true
                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                        if not L1_2 then
                          L1_2 = string
                          L1_2 = L1_2.find
                          L2_2 = A0_2
                          L3_2 = ".o"
                          L4_2 = -2
                          L5_2 = true
                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                          if not L1_2 then
                            L1_2 = string
                            L1_2 = L1_2.find
                            L2_2 = A0_2
                            L3_2 = "/private/tmp/PKInstallSandbox[^/]+/tmp/qlist$"
                            L4_2 = 1
                            L5_2 = false
                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                            if not L1_2 then
                              L1_2 = string
                              L1_2 = L1_2.find
                              L2_2 = A0_2
                              L3_2 = "/private/tmp/oe-kandji/miniconda/.*/appkit_launcher_x86_64$"
                              L4_2 = 1
                              L5_2 = false
                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                              if not L1_2 then
                                L1_2 = string
                                L1_2 = L1_2.find
                                L2_2 = A0_2
                                L3_2 = "/target/debug/build/.*/build-script-build$"
                                L4_2 = 1
                                L5_2 = false
                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                if not L1_2 then
                                  L1_2 = string
                                  L1_2 = L1_2.find
                                  L2_2 = A0_2
                                  L3_2 = "/private/tmp/monorepo/bazel_disk_cache/"
                                  L4_2 = 1
                                  L5_2 = true
                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                  if not L1_2 then
                                    L1_2 = string
                                    L1_2 = L1_2.find
                                    L2_2 = A0_2
                                    L3_2 = "/private/tmp/.cache/bazel/"
                                    L4_2 = 1
                                    L5_2 = true
                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                    if not L1_2 then
                                      L1_2 = string
                                      L1_2 = L1_2.find
                                      L2_2 = A0_2
                                      L3_2 = "conftest.dSYM/Contents/Resources/DWARF/conftest"
                                      L4_2 = 1
                                      L5_2 = true
                                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                      if not L1_2 then
                                        L1_2 = string
                                        L1_2 = L1_2.find
                                        L2_2 = A0_2
                                        L3_2 = ".pcm"
                                        L4_2 = -4
                                        L5_2 = true
                                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                        if not L1_2 then
                                          L1_2 = string
                                          L1_2 = L1_2.find
                                          L2_2 = A0_2
                                          L3_2 = "/bazel_disk_cache/tmp/"
                                          L4_2 = 1
                                          L5_2 = true
                                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                          if not L1_2 then
                                            L1_2 = string
                                            L1_2 = L1_2.find
                                            L2_2 = A0_2
                                            L3_2 = "/private/tmp/build-cache/tmp/"
                                            L4_2 = 1
                                            L5_2 = true
                                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                            if not L1_2 then
                                              L1_2 = string
                                              L1_2 = L1_2.find
                                              L2_2 = A0_2
                                              L3_2 = "/private/tmp/bazel-sandbox/"
                                              L4_2 = 1
                                              L5_2 = true
                                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                              if not L1_2 then
                                                L1_2 = string
                                                L1_2 = L1_2.find
                                                L2_2 = A0_2
                                                L3_2 = "/private/tmp/homebrew-unpack/"
                                                L4_2 = 1
                                                L5_2 = true
                                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                if not L1_2 then
                                                  L1_2 = string
                                                  L1_2 = L1_2.find
                                                  L2_2 = A0_2
                                                  L3_2 = "/private/tmp/bazel-sandbox.[^/]+/darwin-sandbox"
                                                  L4_2 = 1
                                                  L5_2 = false
                                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                  if not L1_2 then
                                                    L1_2 = string
                                                    L1_2 = L1_2.find
                                                    L2_2 = A0_2
                                                    L3_2 = "/private/tmp/AV%-%d+%-%d+%-%d+"
                                                    L4_2 = 1
                                                    L5_2 = false
                                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                    if not L1_2 then
                                                      L1_2 = string
                                                      L1_2 = L1_2.find
                                                      L2_2 = A0_2
                                                      L3_2 = "/Users/[^/]+/Epic Games/[^/]+/.egstore/"
                                                      L4_2 = 1
                                                      L5_2 = false
                                                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                      if not L1_2 then
                                                        L1_2 = string
                                                        L1_2 = L1_2.find
                                                        L2_2 = A0_2
                                                        L3_2 = "/private/tmp/fbcode_.*/CMakeFiles/CMakeTmp/"
                                                        L4_2 = 1
                                                        L5_2 = false
                                                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                        if not L1_2 then
                                                          L1_2 = string
                                                          L1_2 = L1_2.find
                                                          L2_2 = A0_2
                                                          L3_2 = "/private/tmp/rustc[^/]+/lib.rmeta$"
                                                          L4_2 = 1
                                                          L5_2 = false
                                                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                          if not L1_2 then
                                                            L1_2 = string
                                                            L1_2 = L1_2.find
                                                            L2_2 = A0_2
                                                            L3_2 = "^/private/var/folders/.*/ilastik-[^/]+/Contents/ilastik-release/bin/"
                                                            L4_2 = 1
                                                            L5_2 = false
                                                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                            if not L1_2 then
                                                              L1_2 = string
                                                              L1_2 = L1_2.find
                                                              L2_2 = A0_2
                                                              L3_2 = "/Volumes/SSD/JUser/.*/Intermediate/Build/IOS"
                                                              L4_2 = 1
                                                              L5_2 = false
                                                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                              if not L1_2 then
                                                                L1_2 = string
                                                                L1_2 = L1_2.find
                                                                L2_2 = A0_2
                                                                L3_2 = "/Users/[^/]+/.*/%.egstore/bps/"
                                                                L4_2 = 1
                                                                L5_2 = false
                                                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                                if not L1_2 then
                                                                  L1_2 = string
                                                                  L1_2 = L1_2.find
                                                                  L2_2 = A0_2
                                                                  L3_2 = "/private/tmp/deviceConnect-Services-"
                                                                  L4_2 = 1
                                                                  L5_2 = true
                                                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                                  if not L1_2 then
                                                                    goto lbl_313
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_313::
  L1_2 = false
  return L1_2
end

IsAdhocMacOSExcluded = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = true
    return L3_2
  end
  L3_2 = {}
  L3_2["com.nordvpn.macos.helper.plist"] = "/Library/PrivilegedHelperTools/com.nordvpn.macos.helper"
  L3_2["com.docker.socket.plist"] = "/Library/PrivilegedHelperTools/com.docker.socket"
  L3_2["com.docker.vmnetd.plist"] = "/Library/PrivilegedHelperTools/com.docker.vmnetd"
  L3_2["com.perimeter81d.plist"] = "/Library/PrivilegedHelperTools/com.perimeter81d.app/Contents/MacOS/com.perimeter81d"
  L3_2["us.zoom.ZoomDaemon.plist"] = "/Library/PrivilegedHelperTools/us.zoom.ZoomDaemon"
  L3_2["us.zoom.rooms.daemon.plist"] = "/Library/PrivilegedHelperTools/us.zoom.ZoomRoomsDaemon"
  L3_2["com.github.facebook.watchman.plist"] = "/usr/local/bin/watchman"
  L3_2["com.eagleyun.sase.helper.plist"] = "/Library/PrivilegedHelperTools/com.eagleyun.sase.helper"
  L3_2["com.jumpcloud.JumpCloudGoHelper.plist"] = "/Library/PrivilegedHelperTools/com.jumpcloud.JumpCloudGoHelper"
  L3_2["com.merck.adminremove.plist"] = "/usr/local/bin/jamf"
  L3_2["com.microsoft.wdav.schedquickscan.plist"] = "/usr/local/bin/mdatp"
  L3_2["com.xiaohongshu.REDpassDaemon.plist"] = "/usr/local/bin/REDpass/REDpassDaemon"
  L3_2["com.school.limitbw.plist"] = "/usr/local/bin/limit_bw.sh"
  L3_2["com.teamviewer.Helper.plist"] = "/Library/PrivilegedHelperTools/com.teamviewer.Helper"
  L3_2["com.teamviewer.UninstallerHelper.plist"] = "/Library/PrivilegedHelperTools/com.teamviewer.UninstallerHelper"
  L3_2["com.microsoft.wdav.schedfullscan.plist"] = "/usr/local/bin/mdatp"
  L3_2["com.zscaler.preloginui.plist"] = "/Applications/Zscaler/Zscaler.app/Contents/PlugIns/ZscalerService"
  L3_2["com.omnissa.horizon.CDSHelper.plist"] = "/Library/PrivilegedHelperTools/com.omnissa.horizon.CDSHelper"
  L3_2["org.911cellular.cpb.plist"] = "/Library/cpb/911cellular.cpblauncher.sh"
  L3_2["corp.sap.privileges.helper.plist"] = "/Library/PrivilegedHelperTools/corp.sap.privileges.helper"
  L3_2["com.absolute.ctesservice.plist"] = "/Library/.rpcnet/Ctes"
  L3_2["com.github.grahampugh.erase-install.remove.plist"] = "/Library/LaunchDaemons/com.github.grahampugh.erase-install.remove.plist"
  L3_2["com.perimeter81.osx.HelperTool.plist"] = "/Library/PrivilegedHelperTools/com.perimeter81.osx.HelperTool"
  L3_2["com.mcafee.agentMonitor.helper.plist"] = "/Library/PrivilegedHelperTools/com.trellix.agentMonitor.helper"
  L3_2["com.vmware.IDHelper.plist"] = "/Library/PrivilegedHelperTools/com.vmware.IDHelper"
  L3_2["io.vicarius.Topia.plist"] = "/Library/PrivilegedHelperTools/topiad"
  L3_2["com.company.zscalermonitor.plist"] = "/Library/Scripts/zscaler_monitor.sh"
  L3_2["com.company.bluetooth.enforce.plist"] = "/usr/local/bin/bluetooth_enforce.sh"
  L3_2["com.company.synchosts.plist"] = "/usr/local/bin/sync_hosts.sh"
  L3_2["com.addigy.agent.plist"] = "/Library/Addigy/go-agent"
  L3_2["com.rsa.menulet.plist"] = "/Library/Application Support/RSA MFA Agent/Menulet/MFA Agent.app/Contents/MacOS/MFA Agent"
  L3_2["com.epsecurity.bdconnectorservice.plist"] = "/Library/Bitdefender/AVP/product/bin/BDCoreIssues"
  L3_2["com.heimdalSecurity.HM-service-check.plist"] = "/Library/HeimdalSecurity/HM-service-check.sh"
  L3_2["com.apple.fielddiagnostics.appleserviceutility.updaterXPCService.plist"] = "/Library/PrivilegedHelperTools/com.apple.fielddiagnostics.appleserviceutility.updaterd"
  L3_2["com.heimdalsecurity.heimdalAgent.cmdHelper.plist"] = "/Library/PrivilegedHelperTools/com.heimdalsecurity.heimdalAgent.cmdHelper"
  L3_2["com.mspanywhere.agent.agent-N-central.plist"] = "/Library/PrivilegedHelperTools/MSP Anywhere Agent N-central.app/Contents/MacOS/MSP Anywhere Agent"
  L3_2["com.bgrove.activtrak.daemon.plist"] = "/Library/PrivilegedHelperTools/svctcom"
  L3_2["com.mspanywhere.agent.agent-dameware.plist"] = "/Library/PrivilegedHelperTools/Take Control Agent dameware.app/Contents/MacOS/Take Control Agent"
  L3_2["com.login.plist"] = "/Users/Shared/UOS/Login/login.sh"
  L3_2["com.company.appleidlogger.plist"] = "/usr/local/bin/AppleIDLogger.sh"
  L3_2["com.company.bluetooth.enforce.agent.plist"] = "/usr/local/bin/bluetooth_enforce.sh"
  L3_2["com.gcc.wifivpn.enforcer.plist"] = "/usr/local/bin/en0lockdown.swift"
  L3_2["com.tresorit.pfctl.plist"] = "/usr/local/bin/firewall.sh"
  L3_2["com.ntu.jamfconnect.postlogin.plist"] = "/usr/local/bin/jamfconnect_postlogin.sh"
  L3_2["edu.umbc.wifi.enforcer.plist"] = "/usr/local/bin/umbc_wifi_enforcer.sh"
  L3_2["com.company.maclocationlogger.plist"] = "/usr/local/bin/mac_location_logger.sh"
  L4_2 = {}
  L4_2["io.osquery.agent.plist"] = "/private/tmp/mcs/runner"
  L4_2["gitlab-runner.plist"] = "/usr/local/bin/gitlab-runner"
  
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L3_3 = pairs
    L4_3 = A0_3
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      if L6_3 ~= nil and L6_3 ~= "" and L7_3 ~= nil and L7_3 ~= "" and L6_3 == A1_3 and L7_3 == A2_3 then
        L8_3 = true
        return L8_3
      end
    end
    L3_3 = false
    return L3_3
  end
  
  is_persistence_excluded = L5_2
  L5_2 = false
  if A2_2 then
    L6_2 = is_persistence_excluded
    L7_2 = L3_2
    L8_2 = A0_2
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  else
    L6_2 = is_persistence_excluded
    L7_2 = L4_2
    L8_2 = A0_2
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  end
  L7_2 = A1_2
  L6_2 = A1_2.find
  L8_2 = "/Library/PrivilegedHelperTools/com.zuludesk.script"
  L9_2 = 1
  L10_2 = true
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  if not L6_2 then
    L7_2 = A1_2
    L6_2 = A1_2.find
    L8_2 = "/Library/PrivilegedHelperTools/ZscalerPreLogin.app/Contents/MacOS/ZscalerPreLogin"
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if not L6_2 then
      goto lbl_94
    end
  end
  L5_2 = true
  ::lbl_94::
  return L5_2
end

IsPersistenceExcludedMacOS = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = "/applications/visual studio code[^/]+/contents/macos/electron"
  L4_2 = "googleupdater %-%-install"
  L5_2 = "googleupdater %-%-server"
  L6_2 = "/jamf/jamf%.app/"
  L7_2 = "/library/application support/microsoft/"
  L8_2 = "/library/preferences/com.microsoft.autoupdate2.plist"
  L9_2 = "scripts/com.microsoft.edgemac"
  L10_2 = "/applications/google chrome.app/contents/macos/google chrome"
  L11_2 = "mdatp-epp-mitre-setup.sh"
  L12_2 = "mdatp-edr-mitre-setup.sh"
  L13_2 = "launchctl load /library/launchdaemons/com.microsoft.fresno.plist"
  L14_2 = "/library/application support/adobe/com.adobe.armdchelper/adobe acrobat updater.app/"
  L15_2 = "/opt/aws/ssm/data/"
  L16_2 = "/usr/local/libexec/amazon-ena-ethernet"
  L17_2 = "/usr/sbin/periodic"
  L18_2 = "microsoftdefenderatponboardingmacos.sh"
  L19_2 = "/scripts/com.microsoft.package.microsoft_autoupdate.app"
  L20_2 = "/library/application support/jamf/tmp/"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L9_2 = L1_2
    L8_2 = L1_2.find
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

IsExcludedByCmdlineMacOS = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A0_2 == nil or A0_2 == "" then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = {}
  L3_2 = "/private/tmp/"
  L4_2 = "/users/shared/"
  L5_2 = "/private/var/folders/[^/]+/[^/]+/t/.*"
  L6_2 = "/library/caches/"
  L7_2 = "/users/[^/]+/library/metadata/"
  L8_2 = "/applications/celastradepro.app/"
  L9_2 = "/applications/jmttrader.app/"
  L10_2 = "/applications/celastradepro.app/"
  L11_2 = "/library/jmttrader"
  L12_2 = "/applications/unioncryptotrader.app"
  L13_2 = "/library/unioncrypto/"
  L14_2 = "/users/[^/]+/library/user photos/"
  L15_2 = "/users/[^/]+/library/wifipreferences/"
  L16_2 = "/users/[^/]+/library/fonts/"
  L17_2 = "/users/[^/]+/library/saved application state/"
  L18_2 = "/volumes/mirotalk/mirotalk.app"
  L19_2 = "/library/privilegedhelpertools/"
  L20_2 = "/usr/local/bin/"
  L21_2 = "/users/[^/]+/_log"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 ~= nil and 0 < L8_2 then
      if A1_2 and L8_2 == 1 then
        L9_2 = true
        return L9_2
      elseif A1_2 and L8_2 ~= 1 then
        L9_2 = false
        return L9_2
      else
        L9_2 = true
        return L9_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

SuspMacPathsToMonitor = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = false
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = "/opt/microsoft/omsagent/ruby/bin/ruby"
  L4_2 = "/opt/microsoft/dependency-agent/bin/microsoft-dependency-agent"
  L5_2 = "/usr/bin/dpkg"
  L6_2 = "/usr/sbin/grub-install"
  L7_2 = "/usr/sbin/grub2-install"
  L8_2 = "/opt/microsoft/mdatp/sbin/wdavdaemon"
  L9_2 = "/opt/tanium/taniumclient/taniumclient"
  L10_2 = "/opt/tanium/taniumclient/taniumcx"
  L11_2 = "/opt/tanium/taniumclient/tools/epi/taniumendpointindex"
  L12_2 = "/usr/bin/svn"
  L13_2 = "/usr/bin/rpm"
  L14_2 = "/bin/rpm"
  L15_2 = "/bin/yum"
  L16_2 = "/usr/bin/yum"
  L17_2 = "/usr/sbin/logrotate"
  L18_2 = "/usr/bin/unzip"
  L19_2 = "/usr/bin/git"
  L20_2 = "/usr/lib/git-core/git"
  L21_2 = "/usr/bin/mandb"
  L22_2 = "/usr/lib/man-db/mandb"
  L23_2 = "/usr/bin/ccache"
  L24_2 = "/usr/bin/azcopy"
  L25_2 = "/usr/bin/scp"
  L26_2 = "/usr/bin/cp"
  L27_2 = "/usr/bin/mv"
  L28_2 = "/usr/bin/touch"
  L29_2 = "/bin/cp"
  L30_2 = "/bin/mv"
  L31_2 = "/bin/touch"
  L32_2 = "/sbin/auditd"
  L33_2 = "/usr/sbin/shibd"
  L34_2 = "/usr/openv/var/tmp/telemetry"
  L35_2 = "/opt/rapid7/ir_agent/components/insight_agent"
  L36_2 = "/opt/rapid7/ir_agent/ir_agent"
  L37_2 = "/usr/sbin/esensor"
  L38_2 = "/usr/bin/apt-get"
  L39_2 = "/usr/bin/apt"
  L40_2 = "/opt/splunk/bin/splunkd"
  L41_2 = "/opt/splunk/bin/splunk-optimize"
  L42_2 = "/opt/splunk/bin/mongod"
  L43_2 = "/opt/google/chrome/chrome"
  L44_2 = "/usr/bin/vim"
  L45_2 = "/opt/besclient/bin/besclient"
  L46_2 = "/opt/nessus/sbin/nessusd"
  L47_2 = "/opt/tableau/tableau_server/packages"
  L48_2 = "/var/ossec/bin/ossec-syscheckd"
  L49_2 = "/opt/tivoli/tsm/client/ba/bin/dsmc"
  L50_2 = "/usr/bin/containerd"
  L51_2 = "/opt/jc/bin/jumpcloud-agent"
  L52_2 = "/usr/bin/rubrik/backup_agent_main"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L2_2[20] = L22_2
  L2_2[21] = L23_2
  L2_2[22] = L24_2
  L2_2[23] = L25_2
  L2_2[24] = L26_2
  L2_2[25] = L27_2
  L2_2[26] = L28_2
  L2_2[27] = L29_2
  L2_2[28] = L30_2
  L2_2[29] = L31_2
  L2_2[30] = L32_2
  L2_2[31] = L33_2
  L2_2[32] = L34_2
  L2_2[33] = L35_2
  L2_2[34] = L36_2
  L2_2[35] = L37_2
  L2_2[36] = L38_2
  L2_2[37] = L39_2
  L2_2[38] = L40_2
  L2_2[39] = L41_2
  L2_2[40] = L42_2
  L2_2[41] = L43_2
  L2_2[42] = L44_2
  L2_2[43] = L45_2
  L2_2[44] = L46_2
  L2_2[45] = L47_2
  L2_2[46] = L48_2
  L2_2[47] = L49_2
  L2_2[48] = L50_2
  L2_2[49] = L51_2
  L2_2[50] = L52_2
  L3_2 = "/opt/microsoft/omsagent/plugin/omsbaseline"
  L4_2 = "/usr/bin/zypper"
  L5_2 = "/usr/share/code/code"
  L6_2 = "/snap/code/97/usr/share/code/code"
  L7_2 = "/usr/bin/docker-registry"
  L8_2 = "/opt/kube/bin/etcd"
  L9_2 = "/opt/vrtsralus/bin/beremote"
  L10_2 = "/usr/sbin/useradd"
  L11_2 = "/usr/bin/xclient"
  L12_2 = "/usr/nx/bin/nxserver.bin"
  L13_2 = "/usr/bin/newrelic-infra"
  L14_2 = "/opt/logrhythm/scsm/bin/scsmd"
  L15_2 = "/usr/local/bin/azsecd"
  L16_2 = "/usr/bin/xbstream"
  L17_2 = "/opt/bitdefender/bin/bdupdated"
  L18_2 = "/usr/sbin/cupsd"
  L19_2 = "/opt/gitlab/embedded/bin/svlogd"
  L20_2 = "/opt/illumio_ven/bin/venPlatformHandler"
  L21_2 = "/opt/ds_agent/ds_agent"
  L22_2 = "/usr/bin/dockerd"
  L23_2 = "/usr/share/grafana/bin/grafana-server"
  L24_2 = "/opt/jp1ajs2/bin/ajsschd"
  L25_2 = "/opt/jp1ajs2/bin/ajsflowd"
  L26_2 = "/opt/kaspersky/klnagent64/sbin/klnagent"
  L27_2 = "/usr/bin/doxygen"
  L28_2 = "/opt/mf/bpm/jre/bin/bpm"
  L29_2 = "/opt/generalstorage/dsmisi/bin/dsmisi"
  L30_2 = "/opt/firefox/updater"
  L31_2 = "/opt/resolve/bin/resolve"
  L32_2 = "/opt/fireeye/bin/xagt"
  L33_2 = "/opt/couchbase/bin/memcached"
  L34_2 = "/usr/local/nagios/bin/npcd"
  L2_2[51] = L3_2
  L2_2[52] = L4_2
  L2_2[53] = L5_2
  L2_2[54] = L6_2
  L2_2[55] = L7_2
  L2_2[56] = L8_2
  L2_2[57] = L9_2
  L2_2[58] = L10_2
  L2_2[59] = L11_2
  L2_2[60] = L12_2
  L2_2[61] = L13_2
  L2_2[62] = L14_2
  L2_2[63] = L15_2
  L2_2[64] = L16_2
  L2_2[65] = L17_2
  L2_2[66] = L18_2
  L2_2[67] = L19_2
  L2_2[68] = L20_2
  L2_2[69] = L21_2
  L2_2[70] = L22_2
  L2_2[71] = L23_2
  L2_2[72] = L24_2
  L2_2[73] = L25_2
  L2_2[74] = L26_2
  L2_2[75] = L27_2
  L2_2[76] = L28_2
  L2_2[77] = L29_2
  L2_2[78] = L30_2
  L2_2[79] = L31_2
  L2_2[80] = L32_2
  L2_2[81] = L33_2
  L2_2[82] = L34_2
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 ~= nil then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = L1_2
      L10_2 = L7_2
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 == 1 then
        L8_2 = true
        return L8_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

IsExcludedByImagePath = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L1_2 = IsExcludedByImagePathMacOS
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "/Library/Caches/com.microsoft.autoupdate.helper/Clones.noindex"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = A0_2
    L3_2 = "/private/var/root/crypt_output.plist"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = A0_2
      L3_2 = "/Library/Managed Installs/manifests/SelfServeManifest"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = A0_2
        L3_2 = "/Library/Caches/EFI/locale.plist"
        L4_2 = 1
        L5_2 = true
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = "/Library/PrivilegedHelperTools/us.zoom.ZoomDaemon.tmp"
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L1_2 = string
            L1_2 = L1_2.find
            L2_2 = A0_2
            L3_2 = "/usr/libexec/cups/backend/cirrosprinter"
            L4_2 = 1
            L5_2 = true
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L1_2 = string
              L1_2 = L1_2.find
              L2_2 = A0_2
              L3_2 = "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/manifests/device_manifest.plist.download"
              L4_2 = 1
              L5_2 = true
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = A0_2
                L3_2 = "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/catalogs/device_catalog.plist.download"
                L4_2 = 1
                L5_2 = true
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if not L1_2 then
                  L1_2 = string
                  L1_2 = L1_2.find
                  L2_2 = A0_2
                  L3_2 = "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/InstallInfo.plist"
                  L4_2 = 1
                  L5_2 = true
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if not L1_2 then
                    L1_2 = string
                    L1_2 = L1_2.find
                    L2_2 = A0_2
                    L3_2 = "/Library/Caches/com.microsoft.autoupdate.helper/Clones.noindex/Microsoft [^/]+.app/Contents/_CodeSignature/CodeResources"
                    L4_2 = 1
                    L5_2 = false
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if not L1_2 then
                      L1_2 = string
                      L1_2 = L1_2.find
                      L2_2 = A0_2
                      L3_2 = "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Cookies"
                      L4_2 = 1
                      L5_2 = false
                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                      if not L1_2 then
                        L1_2 = string
                        L1_2 = L1_2.find
                        L2_2 = A0_2
                        L3_2 = "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Application Support/think-cell"
                        L4_2 = 1
                        L5_2 = false
                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                        if not L1_2 then
                          L1_2 = string
                          L1_2 = L1_2.find
                          L2_2 = A0_2
                          L3_2 = "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Saved Application State/com.microsoft.[^/]+.savedState"
                          L4_2 = 1
                          L5_2 = false
                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                          if not L1_2 then
                            L1_2 = string
                            L1_2 = L1_2.find
                            L2_2 = A0_2
                            L3_2 = "/Users/[^/]+/Library/Saved Application State/com.google.Chrome.app.[^/]+.savedState"
                            L4_2 = 1
                            L5_2 = false
                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                            if not L1_2 then
                              L1_2 = string
                              L1_2 = L1_2.find
                              L2_2 = A0_2
                              L3_2 = "/Users/[^/]+/Library/Saved Application State/com.google.Chrome.app.[^/]+.savedState"
                              L4_2 = 1
                              L5_2 = false
                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                              if not L1_2 then
                                L1_2 = string
                                L1_2 = L1_2.find
                                L2_2 = A0_2
                                L3_2 = "/Library/Managed Installs/UpdateNotificationTracking.plist"
                                L4_2 = 1
                                L5_2 = true
                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                if not L1_2 then
                                  L1_2 = string
                                  L1_2 = L1_2.find
                                  L2_2 = A0_2
                                  L3_2 = "/private/tmp/boost_interprocess"
                                  L4_2 = 1
                                  L5_2 = true
                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                  if not L1_2 then
                                    L1_2 = string
                                    L1_2 = L1_2.find
                                    L2_2 = A0_2
                                    L3_2 = "/Library/Logs/Netskope"
                                    L4_2 = 1
                                    L5_2 = true
                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                    if not L1_2 then
                                      L1_2 = string
                                      L1_2 = L1_2.find
                                      L2_2 = A0_2
                                      L3_2 = "/Library/Application Support/Zscaler"
                                      L4_2 = 1
                                      L5_2 = true
                                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                      if not L1_2 then
                                        L1_2 = string
                                        L1_2 = L1_2.find
                                        L2_2 = A0_2
                                        L3_2 = "/Library/Application Support/Google"
                                        L4_2 = 1
                                        L5_2 = true
                                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                        if not L1_2 then
                                          L1_2 = string
                                          L1_2 = L1_2.find
                                          L2_2 = A0_2
                                          L3_2 = "/Library/Logs/Microsoft/OneDrive"
                                          L4_2 = 1
                                          L5_2 = true
                                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                          if not L1_2 then
                                            L1_2 = string
                                            L1_2 = L1_2.find
                                            L2_2 = A0_2
                                            L3_2 = "/private/tmp/com.adobe.AcrobatRefreshManager"
                                            L4_2 = 1
                                            L5_2 = true
                                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                            if not L1_2 then
                                              L1_2 = string
                                              L1_2 = L1_2.find
                                              L2_2 = A0_2
                                              L3_2 = "/Library/ManageEngine/UEMS_Agent/data/dupserverinfo.plist"
                                              L4_2 = 1
                                              L5_2 = true
                                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                              if not L1_2 then
                                                L1_2 = string
                                                L1_2 = L1_2.find
                                                L2_2 = A0_2
                                                L3_2 = "/usr/local/munkireport/scripts/cache/firewall.plist"
                                                L4_2 = 1
                                                L5_2 = true
                                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                if not L1_2 then
                                                  L1_2 = string
                                                  L1_2 = L1_2.find
                                                  L2_2 = A0_2
                                                  L3_2 = "/Library/Application Support/Adobe/Acrobat/DC/Preferences/cumuPatch.plist"
                                                  L4_2 = 1
                                                  L5_2 = true
                                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                  if not L1_2 then
                                                    L1_2 = string
                                                    L1_2 = L1_2.find
                                                    L2_2 = A0_2
                                                    L3_2 = "/Library/Application Support/Adobe/Reader/DC/WebResources/Resource.+/OWP$"
                                                    L4_2 = 1
                                                    L5_2 = false
                                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                    if not L1_2 then
                                                      L1_2 = string
                                                      L1_2 = L1_2.find
                                                      L2_2 = A0_2
                                                      L3_2 = "/Library/Application Support/JAMF/tmp.+"
                                                      L4_2 = 1
                                                      L5_2 = false
                                                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                      if not L1_2 then
                                                        L1_2 = string
                                                        L1_2 = L1_2.find
                                                        L2_2 = A0_2
                                                        L3_2 = "/private/tmp/munki-"
                                                        L4_2 = 1
                                                        L5_2 = true
                                                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                        if not L1_2 then
                                                          L1_2 = string
                                                          L1_2 = L1_2.find
                                                          L2_2 = A0_2
                                                          L3_2 = "/private/var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T/DUR[^/]+.json"
                                                          L4_2 = 1
                                                          L5_2 = false
                                                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                          if not L1_2 then
                                                            L1_2 = string
                                                            L1_2 = L1_2.find
                                                            L2_2 = A0_2
                                                            L3_2 = "/private/tmp/nsbranding/enroll.conf"
                                                            L4_2 = 1
                                                            L5_2 = true
                                                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                            if not L1_2 then
                                                              L1_2 = string
                                                              L1_2 = L1_2.find
                                                              L2_2 = A0_2
                                                              L3_2 = "/private/tmp/ip.py"
                                                              L4_2 = 1
                                                              L5_2 = true
                                                              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                              if not L1_2 then
                                                                L1_2 = string
                                                                L1_2 = L1_2.find
                                                                L2_2 = A0_2
                                                                L3_2 = "/private/tmp/com.adobe.acrobat.updater"
                                                                L4_2 = 1
                                                                L5_2 = true
                                                                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                                if not L1_2 then
                                                                  L1_2 = string
                                                                  L1_2 = L1_2.find
                                                                  L2_2 = A0_2
                                                                  L3_2 = "/Users/Shared/SplashtopStreamer"
                                                                  L4_2 = 1
                                                                  L5_2 = true
                                                                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                                  if not L1_2 then
                                                                    L1_2 = string
                                                                    L1_2 = L1_2.find
                                                                    L2_2 = A0_2
                                                                    L3_2 = "/Library/LaunchAgents/com.github.macadmins.Nudge.plist"
                                                                    L4_2 = 1
                                                                    L5_2 = true
                                                                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                                                                    if not L1_2 then
                                                                      goto lbl_322
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_322::
  L1_2 = false
  return L1_2
end

IsChmodMacOSExcluded = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A1_2
    L4_2 = 1
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 == "." then
      goto lbl_19
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_19::
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = "/gpg"
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A1_2
    L4_2 = ".gpg"
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if L2_2 ~= 1 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A1_2
  L4_2 = ".gpg"
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 == 1 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A0_2
    L4_2 = "/gpg"
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if not L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = A1_2
  L3_2 = "\""
  A1_2 = L2_2 .. L3_2
  L2_2 = {}
  L2_2["/usr/local/bin/cmake"] = ".cmake\".make\".marks\""
  L2_2["/usr/bin/cmake"] = ".cmake\".make\".marks\""
  L2_2["/usr/bin/influxd"] = ".tsm\".wal\""
  L2_2["/opt/besclient/bin/besclient"] = ".qid\""
  L2_2["/usr/lib/systemd/systemd"] = ".service\".conf\".scope\".slice\""
  L2_2["/lib/systemd/systemd"] = ".service\".conf\".scope\".slice\""
  L2_2["/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"] = ".deleted\".cql\".snapshot\""
  L2_2["/usr/lib/jvm/java-11-openjdk-amd64/bin/java"] = ".instance\".target\""
  L2_2["/usr/bin/python"] = ".mo\".cocci\""
  L2_2["/usr/libexec/platform-python"] = ".mo\".cmake\".solv\".cocci\".catalog\".service\".erb\""
  L2_2["/usr/local/bin/node"] = ".__ivy_ngcc_bak\".flow\""
  L2_2["/usr/bin/node"] = ".__ivy_ngcc_bak\".graph\""
  L2_2["/usr/lib/firefox-esr/firefox-esr"] = ".final\".vlpset\".sbstore\""
  L2_2["/usr/lib/firefox/firefox"] = ".final\".vlpset\".sbstore\""
  L2_2["/usr/lib64/firefox/firefox"] = ".final\".vlpset\".sbstore\""
  L2_2["/home/vsts/miniconda/bin/python"] = ".c~\""
  L2_2["/home/vsts/miniconda/envs/test_e2e/bin/python"] = ".c~\".pyc\""
  L2_2["/usr/lib/systemd/system-generators/systemd-fstab-generator"] = ".mount\""
  L2_2["/usr/bin/containerd"] = ".del-status\""
  L2_2["/usr/share/teams/teams"] = ".cache-6\".cache-7\""
  L2_2["/usr/bin/x86_64-linux-gnu-gcov-7"] = ".gcov\""
  L2_2["/usr/bin/snap"] = ".cmake\".make\".marks\""
  L2_2["/usr/java/jdk"] = ".jar\""
  L2_2["/usr/sbin/adclient"] = ".pol\""
  L2_2["/opt/atlassian/jira/jre/bin/java"] = ".location\".properties\".nmea\""
  L2_2["/opt/splunk/bin/splunkd"] = ".manifest_values_dirty\""
  L2_2["/opt/splunk/bin/splunk-optimize"] = ".merge\""
  L2_2["/opt/splunk/bin/python"] = ".ckpt\""
  L2_2["/usr/sbin/atopacctd"] = ".paf\""
  L2_2["/usr/sbin/hardlink"] = ".$$$___cleanit___$$$\""
  L2_2["/usr/lib/systemd/user-generators/systemd-xdg-autostart-generator"] = ".service\""
  L2_2["/opt/ds_agent/ds_am"] = ".len\".retry\""
  L2_2["/opt/gitlab/embedded/bin/git"] = ".salt\""
  L2_2["/opt/gitlab/embedded/bin/ruby"] = ".erb\""
  L2_2["/usr/bin/vim"] = ".sh~\".sql~\""
  L2_2["/usr/bin/ruby"] = ".ri\""
  L2_2["/usr/libexec/openssh/sftp-server"] = ".j2\""
  L2_2["/usr/bin/qtcreator"] = ".~\""
  L2_2["/usr/bin/containerd-shim-runc-v2"] = ".address\""
  L2_2["/var/cfengine/bin/cf-agent"] = ".cfnew\".cfedited\""
  L2_2["/var/cfengine/sbin/cfexecd"] = ".cfnew\".cfedited\""
  L2_2["/opt/splunk/bin/mongod"] = ".ns\""
  L2_2["/opt/kube/bin/etcd"] = ".snap\""
  L2_2["/opt/fireeye/bin/xagt"] = ".xmd\""
  L2_2["/usr/bin/nautilus"] = ".trashinfo\""
  L2_2["/opt/Insomnia/insomnia"] = ".db~\""
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L6_2 ~= nil and L6_2 ~= "" then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = L6_2
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 == 1 and L7_2 ~= nil and L7_2 ~= "" then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = L7_2
        L10_2 = A1_2
        L11_2 = 1
        L12_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        if L8_2 then
          L8_2 = true
          return L8_2
        end
      end
    end
  end
  L3_2 = {}
  L3_2["/usr/local/bin/cmake"] = ".cmake\".make\".marks\""
  L3_2["/bin/make"] = ".mk\""
  L3_2["/bin/clang"] = ".shd\".xxxxxx\".gcno\""
  L3_2["/bin/python"] = ".c~\""
  L3_2["/usr/bin/cmake"] = ".cmake\".make\".marks\".in\""
  L4_2 = ".sz\".deleted\".nmea\".cql\".snapshot\".cachedfile\".timeindex\".class\".i1\".original\".tmp\".bak~\""
  L5_2 = ".durbo\".xml~\".etag\".instance\".location\".properties\".feature\".fw\".msg5\".fslck\".parquet\".erf-p\""
  L4_2 = L4_2 .. L5_2
  L3_2["/bin/java"] = L4_2
  L3_2["/usr/bin/fc-cache"] = ".cache-6\".cache-7\""
  L3_2["/usr/bin/node"] = ".__ivy_ngcc_bak\".graph\".lcl\""
  L3_2["/aem65/aemauthor/crx-quickstart"] = "._01_\""
  L3_2["/usr/sbin/grub-install"] = ".mod\".mod-\""
  L3_2["/usr/share/code/code"] = ".vsixmanifest\".template\".__ivy_ngcc_bak\""
  L3_2["/bin/adrci"] = ".ams\""
  L3_2["/bin/rsession"] = ".snapshot\""
  L3_2["/bin/node"] = ".__ivy_ngcc_bak\".graph\""
  L3_2["/steam"] = ".old\""
  L3_2["/usr/bin/nvim"] = ".wiki\".go~\""
  L3_2["/bin/postgres"] = ".done\""
  L3_2["/bin/iccarm"] = ".xxxxxx\""
  L3_2["/sqllib/adm/db2sysc"] = ".log\".tda\""
  L3_2["/usr/sbin/php-fpm"] = ".bup\".html_old\".html_gzip_old\""
  L3_2["/opt/mqsi/iib-10.0.0.26/server/bin/DataFlowEngine"] = ".rmv\""
  L3_2["/bin/gcc"] = ".xxxxxx\""
  L3_2["/usr/bin/ccache"] = ".xxxxxx\""
  L3_2["/opt/firefox/firefox-bin"] = ".moz-backup\""
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = string
    L9_2 = L9_2.find
    L10_2 = A0_2
    L11_2 = L7_2
    L12_2 = 1
    L13_2 = true
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    if L9_2 then
      L9_2 = string
      L9_2 = L9_2.find
      L10_2 = L8_2
      L11_2 = A1_2
      L12_2 = 1
      L13_2 = true
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
      if L9_2 then
        L9_2 = true
        return L9_2
      end
    end
  end
  L4_2 = false
  return L4_2
end

IsExcludedByImagePathFileExtension = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A1_2
    L4_2 = 1
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 == "." then
      goto lbl_19
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_19::
  L2_2 = A1_2
  L3_2 = "\""
  A1_2 = L2_2 .. L3_2
  L2_2 = {}
  L2_2["/opt/cmake%-(.+)/bin/cmake"] = ".cmake\".make\".marks\""
  L2_2["/snap/cmake/(%d+)/bin/cmake"] = ".cmake\".make\".marks\""
  L2_2["/snap/snapd/(%d+)/usr/bin/snap"] = ".cmake\".make\".marks\""
  L2_2["/usr/lib/jvm/java%-(.+)%-openjdk%-(.*)/(%w+)/bin/java"] = ".deleted\".ndjson\".nmea\".target\".jmm\".dbtmp\".fnt\".1\".class\""
  L2_2["/snap/core/(%d+)/lib/x86_64%-linux%-gnu/(.*)"] = ".cache-6\".cache-7\""
  L2_2["/snap/firefox/(%d+)/usr/lib/firefox/firefox"] = ".final\""
  L2_2["/snap/postman/(%d+)/usr/share/postman/postman"] = ".cache-6\".cache-7\""
  L2_2["/snap/teams-for-linux/(%d+)/teams-for-linux"] = ".cache-6\".cache-7\""
  L2_2["/snap/notepad-plus-plus/(%d+)/gnome-platform/usr/bin/fc-cache"] = ".cache-6\".cache-7\""
  L2_2["/opt/tableau/tableau_server/packages/pgsql%.(%d+)%.(%d+)%.(%d+)%.(%d+)/bin/postgres"] = ".done\".ftl\""
  L2_2["/opt/tableau/tableau_server/packages/apigateway%.(%d+)%.(%d+)%.(%d+)%.(%d+)/run-apigateway"] = ".done\".ftl\""
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L6_2 ~= nil and L6_2 ~= "" then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = L6_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 == 1 and L7_2 ~= nil and L7_2 ~= "" then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = L7_2
        L10_2 = A1_2
        L11_2 = 1
        L12_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        if L8_2 then
          L8_2 = true
          return L8_2
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end

IsExcludedByImagePathFileExtensionRegEx = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A1_2
    L4_2 = 1
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 ~= "." then
      goto lbl_19
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_19::
  L2_2 = "\""
  L3_2 = A1_2
  L4_2 = "\""
  A1_2 = L2_2 .. L3_2 .. L4_2
  L2_2 = {}
  L2_2["/usr/bin/qtcreator"] = "\"~\""
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L6_2 ~= nil and L6_2 ~= "" then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = L6_2
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 == 1 and L7_2 ~= nil and L7_2 ~= "" then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = L7_2
        L10_2 = A1_2
        L11_2 = 1
        L12_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        if L8_2 then
          L8_2 = true
          return L8_2
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end

IsExcludedByImagePathFileExtensionSuffix = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A1_2
    L4_2 = 1
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 == "." then
      goto lbl_19
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_19::
  L3_2 = A0_2
  L2_2 = A0_2.lower
  L2_2 = L2_2(L3_2)
  L3_2 = IsExcludedByImagePathFileExtension
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = IsExcludedByImagePathFileExtensionRegEx
    L4_2 = L2_2
    L5_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2)
  end
  return L3_2
end

IsRansomwareProcessImagePathExtensionExcluded = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 ~= nil and A0_2 ~= "" and A1_2 ~= nil and A1_2 ~= "" then
    L2_2 = string
    L2_2 = L2_2.sub
    L3_2 = A1_2
    L4_2 = 1
    L5_2 = 1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 == "." then
      goto lbl_19
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_19::
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "pid:(%w+),ProcessStart:(%w+)"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil or L2_2 == "" then
    L4_2 = false
    return L4_2
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = A1_2
  L6_2 = L2_2
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 ~= 2 then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A1_2
    L6_2 = ".log"
    L7_2 = L2_2
    L6_2 = L6_2 .. L7_2
    L7_2 = 1
    L8_2 = true
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if L4_2 ~= 1 then
      goto lbl_52
    end
  end
  L4_2 = true
  do return L4_2 end
  ::lbl_52::
  L4_2 = false
  return L4_2
end

CheckFileExtnIncludeProcessId = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 ~= nil then
    L2_2 = #A0_2
    if L2_2 ~= 0 and A1_2 ~= nil and A1_2 ~= "" then
      goto lbl_12
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_12::
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if A1_2 == L6_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

IsStringInTable = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A2_2 ~= 0 and A0_2 ~= nil and A1_2 ~= nil then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "table" then
      goto lbl_14
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_14::
  L3_2 = mp
  L3_2 = L3_2.GetParentProcInfo
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    L4_2 = mp
    L4_2 = L4_2.GetProcessCommandLine
    L5_2 = L3_2.ppid
    L4_2 = L4_2(L5_2)
    L5_2 = L3_2.image_path
    if L5_2 ~= nil then
      L5_2 = L3_2.image_path
      if L5_2 ~= "" and L4_2 ~= nil and L4_2 ~= "" then
        L5_2 = ipairs
        L6_2 = A1_2
        L5_2, L6_2, L7_2 = L5_2(L6_2)
        for L8_2, L9_2 in L5_2, L6_2, L7_2 do
          L10_2 = string
          L10_2 = L10_2.find
          L11_2 = L3_2.image_path
          L12_2 = L9_2[1]
          L13_2 = 1
          L14_2 = true
          L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
          if L10_2 then
            L10_2 = string
            L10_2 = L10_2.find
            L11_2 = L4_2
            L12_2 = L9_2[2]
            L13_2 = 1
            L14_2 = true
            L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            if L10_2 then
              L10_2 = true
              return L10_2
            end
          end
        end
      end
    end
    L5_2 = checkParentCmdline
    L6_2 = L3_2.ppid
    L7_2 = A1_2
    L8_2 = A2_2 - 1
    return L5_2(L6_2, L7_2, L8_2)
  end
  L4_2 = false
  return L4_2
end

checkParentCmdline = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 then
    L4_2 = type
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "table" then
      goto lbl_10
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_10::
  if not A3_2 then
    A3_2 = true
  end
  L4_2 = type
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= "boolean" then
    L4_2 = false
    return L4_2
  end
  L4_2 = ipairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = string
    L9_2 = L9_2.lower
    L10_2 = L8_2[1]
    L9_2 = L9_2(L10_2)
    L8_2[1] = L9_2
    L9_2 = string
    L9_2 = L9_2.lower
    L10_2 = L8_2[2]
    L9_2 = L9_2(L10_2)
    L8_2[2] = L9_2
  end
  
  function L4_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    if A2_3 ~= 0 and A0_3 ~= nil and A1_3 ~= nil then
      L4_3 = type
      L5_3 = A1_3
      L4_3 = L4_3(L5_3)
      if L4_3 == "table" then
        goto lbl_14
      end
    end
    L4_3 = false
    do return L4_3 end
    ::lbl_14::
    L4_3 = mp
    L4_3 = L4_3.GetParentProcInfo
    L5_3 = A0_3
    L4_3 = L4_3(L5_3)
    if L4_3 ~= nil then
      L5_3 = mp
      L5_3 = L5_3.GetProcessCommandLine
      L6_3 = L4_3.ppid
      L5_3 = L5_3(L6_3)
      L6_3 = L4_3.image_path
      if L6_3 then
        L6_3 = L4_3.image_path
        if L6_3 ~= "" and L5_3 and L5_3 ~= "" then
          L6_3 = ipairs
          L7_3 = A1_3
          L6_3, L7_3, L8_3 = L6_3(L7_3)
          for L9_3, L10_3 in L6_3, L7_3, L8_3 do
            L11_3 = string
            L11_3 = L11_3.find
            L12_3 = string
            L12_3 = L12_3.lower
            L13_3 = L4_3.image_path
            L12_3 = L12_3(L13_3)
            L13_3 = L10_3[1]
            L14_3 = 1
            L15_3 = A3_3
            L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3)
            if L11_3 then
              L11_3 = string
              L11_3 = L11_3.find
              L12_3 = string
              L12_3 = L12_3.lower
              L13_3 = L5_3
              L12_3 = L12_3(L13_3)
              L13_3 = L10_3[2]
              L14_3 = 1
              L15_3 = A3_3
              L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3)
              if L11_3 then
                L11_3 = true
                L12_3 = L4_3.image_path
                L13_3 = L5_3
                L14_3 = L4_3.ppid
                return L11_3, L12_3, L13_3, L14_3
              end
            end
          end
        end
      end
      L6_3 = checkParentCmdlineLowerCase
      L7_3 = L4_3.ppid
      L8_3 = A1_3
      L9_3 = A2_3 - 1
      return L6_3(L7_3, L8_3, L9_3)
    end
    L5_3 = false
    return L5_3
  end
  
  checkParentCmdlineLowerCase = L4_2
  L4_2 = checkParentCmdlineLowerCase
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end

checkParentCmdlineCaseInsensitive = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2
  L0_2 = {}
  L1_2 = {}
  L2_2 = "/usr/bin/python"
  L3_2 = "/usr/bin/python /bin/yum"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L2_2 = {}
  L3_2 = "/usr/bin/python"
  L4_2 = "/usr/bin/python /usr/bin/yum"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = {}
  L4_2 = "/usr/bin/python"
  L5_2 = "/usr/bin/python3 /bin/yum"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = {}
  L5_2 = "/usr/bin/python"
  L6_2 = "/usr/bin/python3 /usr/bin/yum"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = {}
  L6_2 = "/usr/libexec/platform-python"
  L7_2 = "/usr/libexec/platform-python /bin/yum"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L6_2 = {}
  L7_2 = "/usr/libexec/platform-python"
  L8_2 = "/usr/libexec/platform-python /usr/bin/dnf"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L7_2 = {}
  L8_2 = "/usr/libexec/platform-python"
  L9_2 = "/usr/libexec/platform-python /usr/bin/yum"
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = {}
  L9_2 = "/usr/bin/dpkg"
  L10_2 = ""
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = {}
  L10_2 = "/bin/rpm"
  L11_2 = ""
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L10_2 = {}
  L11_2 = "/usr/bin/rpm"
  L12_2 = ""
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L11_2 = {}
  L12_2 = "/usr/bin/python"
  L13_2 = "/usr/bin/python /bin/dnf"
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L12_2 = {}
  L13_2 = "/usr/bin/python"
  L14_2 = "/usr/bin/python3 /bin/dnf"
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L13_2 = {}
  L14_2 = "/usr/bin/python"
  L15_2 = "/usr/bin/pip"
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L14_2 = {}
  L15_2 = ""
  L16_2 = "pip install"
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L15_2 = {}
  L16_2 = ""
  L17_2 = "/bin/pip list"
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L16_2 = {}
  L17_2 = ""
  L18_2 = "/yum"
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L17_2 = {}
  L18_2 = ""
  L19_2 = "/.ansible/"
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L18_2 = {}
  L19_2 = "/usr/libexec/platform-python"
  L20_2 = "/usr/bin/pip"
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L19_2 = {}
  L20_2 = ""
  L21_2 = "/usr/libexec/platform-python /usr/bin/dnf"
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L20_2 = {}
  L21_2 = ""
  L22_2 = "/usr/libexec/platform-python /bin/dnf"
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L21_2 = {}
  L22_2 = "/usr/lib/snapd/snapd"
  L23_2 = ""
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L22_2 = {}
  L23_2 = "/usr/bin/apt"
  L24_2 = ""
  L22_2[1] = L23_2
  L22_2[2] = L24_2
  L23_2 = {}
  L24_2 = "/usr/bin/apt-get"
  L25_2 = ""
  L23_2[1] = L24_2
  L23_2[2] = L25_2
  L24_2 = {}
  L25_2 = "/usr/bin/python"
  L26_2 = "/usr/bin/dpkg"
  L24_2[1] = L25_2
  L24_2[2] = L26_2
  L25_2 = {}
  L26_2 = "/usr/bin/python"
  L27_2 = "/usr/bin/python3 /usr/bin/unattended-upgrade"
  L25_2[1] = L26_2
  L25_2[2] = L27_2
  L26_2 = {}
  L27_2 = "/usr/bin/node"
  L28_2 = "install"
  L26_2[1] = L27_2
  L26_2[2] = L28_2
  L27_2 = {}
  L28_2 = "/bin/node"
  L29_2 = "npm"
  L27_2[1] = L28_2
  L27_2[2] = L29_2
  L28_2 = {}
  L29_2 = "/usr/lib/dracut/dracut-install"
  L30_2 = ""
  L28_2[1] = L29_2
  L28_2[2] = L30_2
  L29_2 = {}
  L30_2 = "/usr/sbin/hardlink"
  L31_2 = "/sbin/dracut -f /boot/initramfs"
  L29_2[1] = L30_2
  L29_2[2] = L31_2
  L30_2 = {}
  L31_2 = "/usr/bin/zypper"
  L32_2 = "install"
  L30_2[1] = L31_2
  L30_2[2] = L32_2
  L31_2 = {}
  L32_2 = "/usr/bin/zypper"
  L33_2 = "remove"
  L31_2[1] = L32_2
  L31_2[2] = L33_2
  L32_2 = {}
  L33_2 = "/usr/bin/zypper"
  L34_2 = "refresh"
  L32_2[1] = L33_2
  L32_2[2] = L34_2
  L33_2 = {}
  L34_2 = "/usr/bin/zypper"
  L35_2 = "verify"
  L33_2[1] = L34_2
  L33_2[2] = L35_2
  L34_2 = {}
  L35_2 = "/usr/bin/zypper"
  L36_2 = "update"
  L34_2[1] = L35_2
  L34_2[2] = L36_2
  L35_2 = {}
  L36_2 = "/usr/bin/zypper"
  L37_2 = "upgrade"
  L35_2[1] = L36_2
  L35_2[2] = L37_2
  L36_2 = {}
  L37_2 = "/usr/bin/zypper"
  L38_2 = "patch"
  L36_2[1] = L37_2
  L36_2[2] = L38_2
  L37_2 = {}
  L38_2 = "/usr/bin/python "
  L39_2 = "/usr/bin/needs-restarting"
  L37_2[1] = L38_2
  L37_2[2] = L39_2
  L38_2 = {}
  L39_2 = "/usr/bin/openssl"
  L40_2 = "openssl ca"
  L38_2[1] = L39_2
  L38_2[2] = L40_2
  L39_2 = {}
  L40_2 = ""
  L41_2 = "/usr/local/sbin/sysconfig -all"
  L39_2[1] = L40_2
  L39_2[2] = L41_2
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  L0_2[10] = L10_2
  L0_2[11] = L11_2
  L0_2[12] = L12_2
  L0_2[13] = L13_2
  L0_2[14] = L14_2
  L0_2[15] = L15_2
  L0_2[16] = L16_2
  L0_2[17] = L17_2
  L0_2[18] = L18_2
  L0_2[19] = L19_2
  L0_2[20] = L20_2
  L0_2[21] = L21_2
  L0_2[22] = L22_2
  L0_2[23] = L23_2
  L0_2[24] = L24_2
  L0_2[25] = L25_2
  L0_2[26] = L26_2
  L0_2[27] = L27_2
  L0_2[28] = L28_2
  L0_2[29] = L29_2
  L0_2[30] = L30_2
  L0_2[31] = L31_2
  L0_2[32] = L32_2
  L0_2[33] = L33_2
  L0_2[34] = L34_2
  L0_2[35] = L35_2
  L0_2[36] = L36_2
  L0_2[37] = L37_2
  L0_2[38] = L38_2
  L0_2[39] = L39_2
  return L0_2
end

GetPackageMangerExclusion = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 == nil or A0_2 == "" or A1_2 == nil or A1_2 == "" then
    L3_2 = "Failed to fetch process details"
    L4_2 = bm
    L4_2 = L4_2.add_related_string
    L5_2 = "proc_context_info"
    L6_2 = L3_2
    L7_2 = bm
    L7_2 = L7_2.RelatedStringBMReport
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = false
    return L4_2
  end
  if A2_2 == nil then
    L3_2 = GetPackageMangerExclusion
    L3_2 = L3_2()
    A2_2 = L3_2
  end
  if A2_2 ~= nil then
    L3_2 = type
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "table" then
      goto lbl_33
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_33::
  L3_2 = ipairs
  L4_2 = A2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2[1]
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A1_2
      L10_2 = L7_2[2]
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      if L8_2 then
        L8_2 = true
        return L8_2
      end
    end
  end
  L3_2 = A0_2
  L4_2 = ":cmdline:"
  L5_2 = A1_2
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = bm
  L4_2 = L4_2.add_related_string
  L5_2 = "proc_context_info"
  L6_2 = L3_2
  L7_2 = bm
  L7_2 = L7_2.RelatedStringBMReport
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = false
  return L4_2
end

CheckProcessImagePathAndCommandlineExclusionLinux = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = GetPackageMangerExclusion
  L2_2 = L2_2()
  if L2_2 ~= nil then
    L3_2 = type
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "table" then
      goto lbl_16
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_16::
  if A1_2 then
    L3_2 = nil
    L4_2 = bm
    if L4_2 then
      L4_2 = bm
      L4_2 = L4_2.get_imagepath
      L4_2 = L4_2()
      L3_2 = L4_2
    else
      L4_2 = MpCommon
      L4_2 = L4_2.GetImagePathFromPid
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L3_2 = L4_2
    end
    L4_2 = mp
    L4_2 = L4_2.GetProcessCommandLine
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L3_2 == nil or L3_2 == "" or L4_2 == nil or L4_2 == "" then
      L5_2 = "Failed to fetch process details for "
      L6_2 = A0_2
      L5_2 = L5_2 .. L6_2
      L6_2 = bm
      L6_2 = L6_2.add_related_string
      L7_2 = "error"
      L8_2 = L5_2
      L9_2 = bm
      L9_2 = L9_2.RelatedStringBMReport
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = false
      return L6_2
    end
    L5_2 = ipairs
    L6_2 = L2_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2, L9_2 in L5_2, L6_2, L7_2 do
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = L3_2
      L12_2 = L9_2[1]
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 then
        L10_2 = string
        L10_2 = L10_2.find
        L11_2 = L4_2
        L12_2 = L9_2[2]
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L10_2 = true
          return L10_2
        end
      end
    end
  end
  L3_2 = checkParentCmdline
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = 3
  return L3_2(L4_2, L5_2, L6_2)
end

isParentPackageManager = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  if L0_2 ~= nil then
    L1_2 = L0_2.ppid
    if L1_2 ~= nil then
      L1_2 = L0_2.command_line
      if L1_2 ~= "" then
        goto lbl_14
      end
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_14::
  L1_2 = isParentPackageManager
  L2_2 = L0_2.ppid
  L3_2 = false
  return L1_2(L2_2, L3_2)
end

CheckParentPackageManager = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  if not A0_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = A0_2
  L5_2 = "(%d+)%.(%d+)%.(%d+)%.(%d+)"
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L3_2(L4_2, L5_2)
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L3_2 = {}
  L4_2 = 24
  L5_2 = 16
  L6_2 = 8
  L7_2 = 0
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L4_2 = 1
  L5_2 = 4
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = tonumber
    L9_2 = L2_2[L7_2]
    if not L9_2 then
      L9_2 = 256
    end
    L8_2 = L8_2(L9_2)
    if 255 < L8_2 then
      L9_2 = nil
      return L9_2
    end
    L9_2 = mp
    L9_2 = L9_2.shl32
    L10_2 = L8_2
    L11_2 = L3_2[L7_2]
    L9_2 = L9_2(L10_2, L11_2)
    L1_2 = L1_2 + L9_2
  end
  return L1_2
end

ipv4ToInt = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = 167772160
  L4_2 = 8
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = {}
  L4_2 = 2886729728
  L5_2 = 12
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = {}
  L5_2 = 3232235520
  L6_2 = 16
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = {}
  L6_2 = 3758096384
  L7_2 = 4
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L2_2 = ipv4ToInt
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if not A0_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = mp
    L7_2 = L7_2.shl32
    L8_2 = 4294967295
    L9_2 = L6_2[2]
    L9_2 = 32 - L9_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = L6_2[1]
    L9_2 = mp
    L9_2 = L9_2.bitand
    L10_2 = A0_2
    L11_2 = L7_2
    L9_2 = L9_2(L10_2, L11_2)
    if L8_2 == L9_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end

ipv4IsPrivateRange = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = math_floor
  L2_2 = A0_2 / 8
  L1_2 = L1_2(L2_2)
  L2_2 = math_floor
  L3_2 = 8 * L1_2
  L3_2 = A0_2 - L3_2
  L3_2 = L3_2 / 2
  L2_2 = L2_2(L3_2)
  L3_2 = {}
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  return L3_2
end

keyboardCoords = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = "`~      1!qQaAzZ2@wWsSxX3#eEdDcC4$rRfFvV5%tTgGbB6^yYhHnN7&uUjJmM8*iIkK,<9(oOlL.>0)pP;:/?-_[{'\"  =+]}      \\|"
  L4_2 = L2_2
  L3_2 = L2_2.find
  L5_2 = A0_2
  L6_2 = 1
  L7_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L5_2 = L2_2
  L4_2 = L2_2.find
  L6_2 = A1_2
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L3_2 or not L4_2 then
    L5_2 = 1000
    return L5_2
  end
  L3_2 = L3_2 - 1
  L4_2 = L4_2 - 1
  L5_2 = keyboardCoords
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = keyboardCoords
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = euclideanDistance
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L5_2[2]
  L9_2 = L6_2[2]
  if L8_2 < L9_2 then
    L8_2 = L5_2[1]
    L9_2 = L6_2[1]
    if L8_2 < L9_2 then
      L7_2 = L7_2 + 1
    end
  end
  return L7_2
end

keyDistance = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = pcall
  L4_2 = MpCommon
  L4_2 = L4_2.TypoDistance
  L5_2 = A0_2
  L6_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 and L4_2 then
    return L4_2
  end
  L5_2 = 1000
  return L5_2
end

typoDistance = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = split
  L2_2 = A0_2
  L3_2 = "."
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = tonumber
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L1_2[L5_2] = L7_2
  end
  return L1_2
end

parseIPv4Address = L3_1

function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = getIpAddressClass
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 == 3
  return L1_2
end

isPublicIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = getIpAddressClass
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 == 1
  return L1_2
end

isPrivateIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = parseIPv4Address
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = mp
  L2_2 = L2_2.shl32
  L3_2 = L1_2[1]
  L4_2 = 24
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = mp
  L3_2 = L3_2.shl32
  L4_2 = L1_2[2]
  L5_2 = 16
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 + L3_2
  L3_2 = mp
  L3_2 = L3_2.shl32
  L4_2 = L1_2[3]
  L5_2 = 8
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 + L3_2
  L3_2 = L1_2[4]
  L2_2 = L2_2 + L3_2
  return L2_2
end

IPv4toNumber = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = IPv4toNumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = IPv4toNumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = getIpAddressClass
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = getIpAddressClass
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L4_2 == L5_2 then
    L6_2 = math_base
    L7_2 = mp
    L7_2 = L7_2.bitxor
    L8_2 = L2_2
    L9_2 = L3_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 2
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = #L6_2
    return L6_2
  else
    L6_2 = 32
    return L6_2
  end
end

computeIPDistance = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = computeIPDistance
  L4_2 = A1_2
  L5_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 32 - A2_2
  L3_2 = L3_2 <= L4_2
  return L3_2
end

isIPInNetmaskRange = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = 1
  L2_2 = 2
  L3_2 = 3
  L4_2 = 4
  L5_2 = 5
  L6_2 = 6
  L7_2 = 7
  L8_2 = 8
  L9_2 = parseIPv4Address
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  L10_2 = #L9_2
  if L10_2 == 0 then
    return L8_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 10 then
    return L1_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 192 then
    L10_2 = L9_2[2]
    if L10_2 == 168 then
      return L1_2
    else
      L10_2 = L9_2[2]
      if L10_2 == 0 then
        L10_2 = L9_2[3]
        if L10_2 == 0 then
          return L1_2
        else
          L10_2 = L9_2[3]
          if L10_2 == 2 then
            return L7_2
          end
        end
      else
        L10_2 = L9_2[2]
        if L10_2 == 51 then
          return L7_2
        end
      end
    end
    return L3_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 172 then
    L10_2 = L9_2[2]
    if 16 <= L10_2 then
      L10_2 = L9_2[2]
      if L10_2 <= 31 then
        return L1_2
      end
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 127 then
    return L2_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 128 then
    return L4_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 191 then
    L10_2 = L9_2[2]
    if L10_2 == 255 then
      return L4_2
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 233 then
    L10_2 = L9_2[2]
    if L10_2 == 255 then
      return L4_2
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 169 then
    L10_2 = L9_2[2]
    if L10_2 == 254 then
      return L5_2
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 198 then
    L10_2 = L9_2[2]
    if L10_2 ~= 18 then
      L10_2 = L9_2[2]
      if L10_2 ~= 19 then
        L10_2 = L9_2[2]
        if L10_2 ~= 51 then
          goto lbl_101
        end
        L10_2 = L9_2[3]
        if L10_2 ~= 100 then
          goto lbl_101
        end
      end
    end
    do return L1_2 end
    ::lbl_101::
    return L3_2
  end
  L10_2 = L9_2[1]
  if L10_2 == 203 then
    L10_2 = L9_2[2]
    if L10_2 == 0 then
      L10_2 = L9_2[3]
      if L10_2 == 113 then
        return L7_2
      end
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 100 then
    L10_2 = L9_2[2]
    if 64 <= L10_2 then
      L10_2 = L9_2[2]
      if L10_2 < 128 then
        return L6_2
      end
    end
  end
  L10_2 = L9_2[1]
  if L10_2 == 0 then
    return L4_2
  end
  if A0_2 == "255.255.255.255" then
    return L4_2
  end
  return L3_2
end

getIpAddressClass = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = "PRIVATE"
  L3_2 = "LOOPBACK"
  L4_2 = "PUBLIC"
  L5_2 = "RESERVED"
  L6_2 = "LINKLOCAL"
  L7_2 = "CARRIERGRADE_NAT"
  L8_2 = "TESTNET"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L2_2 = L1_2[A0_2]
  if not L2_2 then
    L2_2 = "Unknown! check mapping!"
  end
  return L2_2
end

getNetClassName = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2
  L0_2 = ""
  L1_2 = {}
  L2_2 = {}
  L3_2 = 1
  L4_2 = 2
  L5_2 = 4
  L6_2 = 8
  L7_2 = 16
  L8_2 = 32
  L9_2 = 64
  L10_2 = 128
  L11_2 = 256
  L12_2 = 512
  L13_2 = 1024
  L14_2 = 2048
  L15_2 = 4096
  L16_2 = 8192
  L17_2 = 16384
  L18_2 = 32768
  
  function L19_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3
    L3_3 = sysio
    L3_3 = L3_3.GetRegValueAsString
    L4_3 = A0_3
    L5_3 = A1_3
    L3_3 = L3_3(L4_3, L5_3)
    if L3_3 then
      L5_3 = L3_3
      L4_3 = L3_3.lower
      L4_3 = L4_3(L5_3)
      L3_3 = L4_3
      L4_3 = L1_2
      L4_3 = L4_3[L3_3]
      if not L4_3 then
        L4_3 = L1_2
        L4_3[L3_3] = A2_3
      else
        L4_3 = L1_2
        L5_3 = mp
        L5_3 = L5_3.bitor
        L6_3 = A2_3
        L7_3 = L1_2
        L7_3 = L7_3[L3_3]
        L5_3 = L5_3(L6_3, L7_3)
        L4_3[L3_3] = L5_3
      end
    end
  end
  
  UpdateDomainInfoList = L19_2
  L19_2 = pcall
  L20_2 = MpCommon
  L20_2 = L20_2.RollingQueueErase
  L21_2 = "domainInfo"
  L19_2(L20_2, L21_2)
  L19_2 = sysio
  L19_2 = L19_2.RegOpenKey
  L20_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\iphlpsvc\\Parameters\\ADHarvest"
  L19_2 = L19_2(L20_2)
  if L19_2 then
    L20_2 = UpdateDomainInfoList
    L21_2 = L19_2
    L22_2 = "LastFetchDomain"
    L23_2 = L3_2
    L20_2(L21_2, L22_2, L23_2)
  end
  L20_2 = sysio
  L20_2 = L20_2.RegOpenKey
  L21_2 = "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Connections"
  L20_2 = L20_2(L21_2)
  if L20_2 then
    L21_2 = UpdateDomainInfoList
    L22_2 = L20_2
    L23_2 = "DefaultConnectionSettings"
    L24_2 = L18_2
    L21_2(L22_2, L23_2, L24_2)
  end
  L21_2 = sysio
  L21_2 = L21_2.RegOpenKey
  L22_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters"
  L21_2 = L21_2(L22_2)
  if L21_2 then
    L22_2 = sysio
    L22_2 = L22_2.GetRegValueAsString
    L23_2 = L21_2
    L24_2 = "HostName"
    L22_2 = L22_2(L23_2, L24_2)
    L0_2 = L22_2
    if L0_2 then
      L23_2 = L0_2
      L22_2 = L0_2.lower
      L22_2 = L22_2(L23_2)
      if L22_2 then
        goto lbl_69
        L0_2 = L22_2 or L0_2
      end
    end
    L0_2 = ""
    ::lbl_69::
    L22_2 = #L0_2
    if 0 < L22_2 then
      L22_2 = AppendToRollingQueue
      L23_2 = "domainInfo"
      L24_2 = "TCP-hostname"
      L25_2 = L0_2
      L26_2 = 604800
      L27_2 = 100
      L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
    end
    L22_2 = UpdateDomainInfoList
    L23_2 = L21_2
    L24_2 = "Domain"
    L25_2 = L4_2
    L22_2(L23_2, L24_2, L25_2)
    L22_2 = UpdateDomainInfoList
    L23_2 = L21_2
    L24_2 = "ICSDomain"
    L25_2 = L5_2
    L22_2(L23_2, L24_2, L25_2)
    L22_2 = sysio
    L22_2 = L22_2.GetRegValueAsString
    L23_2 = L21_2
    L24_2 = "SearchList"
    L22_2 = L22_2(L23_2, L24_2)
    if L22_2 then
      L24_2 = L22_2
      L23_2 = L22_2.lower
      L23_2 = L23_2(L24_2)
      L22_2 = L23_2
      L23_2 = split
      L24_2 = L22_2
      L25_2 = ","
      L23_2 = L23_2(L24_2, L25_2)
      L22_2 = L23_2
      L23_2 = ipairs
      L24_2 = L22_2
      L23_2, L24_2, L25_2 = L23_2(L24_2)
      for L26_2, L27_2 in L23_2, L24_2, L25_2 do
        L28_2 = L2_2[L27_2]
        if not L28_2 then
          L2_2[L27_2] = 1
          L28_2 = AppendToRollingQueue
          L29_2 = "TCP-searchList"
          L30_2 = L27_2
          L31_2 = 1
          L32_2 = 604800
          L33_2 = 100
          L28_2(L29_2, L30_2, L31_2, L32_2, L33_2)
        end
      end
    end
  end
  L22_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces"
  L23_2 = sysio
  L23_2 = L23_2.RegOpenKey
  L24_2 = L22_2
  L23_2 = L23_2(L24_2)
  if L23_2 then
    L24_2 = sysio
    L24_2 = L24_2.RegEnumKeys
    L25_2 = L23_2
    L24_2 = L24_2(L25_2)
    if L24_2 then
      L25_2 = ipairs
      L26_2 = L24_2
      L25_2, L26_2, L27_2 = L25_2(L26_2)
      for L28_2, L29_2 in L25_2, L26_2, L27_2 do
        L30_2 = sysio
        L30_2 = L30_2.RegOpenKey
        L31_2 = string
        L31_2 = L31_2.format
        L32_2 = "%s\\%s"
        L33_2 = L22_2
        L34_2 = L29_2
        L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2 = L31_2(L32_2, L33_2, L34_2)
        L30_2 = L30_2(L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
        if L30_2 then
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "Domain"
          L34_2 = L4_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DhcpDomain"
          L34_2 = L6_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DefaultGateway"
          L34_2 = L7_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DhcpDefaultGateway"
          L34_2 = L8_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "IPAddress"
          L34_2 = L9_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DhcpIPAddress"
          L34_2 = L10_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "SubnetMask"
          L34_2 = L11_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DhcpSubnetMask"
          L34_2 = L12_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "NameServer"
          L34_2 = L13_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "DhcpNameServer"
          L34_2 = L14_2
          L31_2(L32_2, L33_2, L34_2)
        end
      end
    end
  end
  L22_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\DNSRegisteredAdapters"
  L24_2 = sysio
  L24_2 = L24_2.RegOpenKey
  L25_2 = L22_2
  L24_2 = L24_2(L25_2)
  L23_2 = L24_2
  if L23_2 then
    L24_2 = sysio
    L24_2 = L24_2.RegEnumKeys
    L25_2 = L23_2
    L24_2 = L24_2(L25_2)
    if L24_2 then
      L25_2 = ipairs
      L26_2 = L24_2
      L25_2, L26_2, L27_2 = L25_2(L26_2)
      for L28_2, L29_2 in L25_2, L26_2, L27_2 do
        L30_2 = sysio
        L30_2 = L30_2.RegOpenKey
        L31_2 = string
        L31_2 = L31_2.format
        L32_2 = "%s\\%s"
        L33_2 = L22_2
        L34_2 = L29_2
        L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2 = L31_2(L32_2, L33_2, L34_2)
        L30_2 = L30_2(L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
        if L30_2 then
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "AdapterDomainName"
          L34_2 = L15_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "Hostname"
          L34_2 = L16_2
          L31_2(L32_2, L33_2, L34_2)
          L31_2 = UpdateDomainInfoList
          L32_2 = L30_2
          L33_2 = "PrimaryDomainName"
          L34_2 = L17_2
          L31_2(L32_2, L33_2, L34_2)
        end
      end
    end
  end
  L22_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters\\Interfaces"
  L24_2 = sysio
  L24_2 = L24_2.RegOpenKey
  L25_2 = L22_2
  L24_2 = L24_2(L25_2)
  L23_2 = L24_2
  if L23_2 then
    L24_2 = sysio
    L24_2 = L24_2.RegEnumKeys
    L25_2 = L23_2
    L24_2 = L24_2(L25_2)
    if L24_2 then
      L25_2 = ipairs
      L26_2 = L24_2
      L25_2, L26_2, L27_2 = L25_2(L26_2)
      for L28_2, L29_2 in L25_2, L26_2, L27_2 do
        L30_2 = sysio
        L30_2 = L30_2.RegOpenKey
        L31_2 = string
        L31_2 = L31_2.format
        L32_2 = "%s\\%s"
        L33_2 = L22_2
        L34_2 = L29_2
        L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2 = L31_2(L32_2, L33_2, L34_2)
        L30_2 = L30_2(L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
        if L30_2 then
          L31_2 = sysio
          L31_2 = L31_2.GetRegValueAsString
          L32_2 = L30_2
          L33_2 = "Dhcpv6DomainSearchList"
          L31_2 = L31_2(L32_2, L33_2)
          if L31_2 then
            L33_2 = L31_2
            L32_2 = L31_2.lower
            L32_2 = L32_2(L33_2)
            L31_2 = L32_2
            L32_2 = L2_2[L31_2]
            if not L32_2 then
              L2_2[L31_2] = 1
              L32_2 = AppendToRollingQueue
              L33_2 = "TCP-searchList"
              L34_2 = L31_2
              L35_2 = 1
              L36_2 = 604800
              L37_2 = 100
              L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
            end
          end
        end
      end
    end
  end
  L24_2 = pairs
  L25_2 = L1_2
  L24_2, L25_2, L26_2 = L24_2(L25_2)
  for L27_2, L28_2 in L24_2, L25_2, L26_2 do
    L29_2 = AppendToRollingQueue
    L30_2 = "domainInfo"
    L31_2 = L27_2
    L32_2 = L28_2
    L33_2 = 604800
    L34_2 = 100
    L29_2(L30_2, L31_2, L32_2, L33_2, L34_2)
  end
  L24_2 = L0_2
  L25_2 = L1_2
  L26_2 = L2_2
  return L24_2, L25_2, L26_2
end

updateDomainInfo = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = IsKeyValuePairInRollingQueue
  L2_2 = "domainInfo"
  L3_2 = "TCP-hostname"
  L4_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if L1_2 then
    L2_2 = 1
    return L2_2
  else
    L2_2 = IsKeyInRollingQueue
    L3_2 = "domainInfo"
    L4_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L3_2 = GetRollingQueueCount
      L4_2 = "domainInfo"
      L3_2 = L3_2(L4_2)
      if not L3_2 then
        L3_2 = 0
      end
      if 0 == L3_2 then
        L4_2 = updateDomainInfo
        L4_2, L5_2, L6_2 = L4_2()
        if L4_2 == A0_2 then
          L7_2 = 1
          return L7_2
        else
          L7_2 = L5_2[A0_2]
          if L7_2 then
            L7_2 = 2
            return L7_2
          end
        end
      end
    end
  end
  L2_2 = 0
  return L2_2
end

isValidLocalDomain = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = {}
  L1_2 = {}
  L2_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList"
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumKeys
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = ipairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = sysio
        L10_2 = L10_2.RegOpenKey
        L11_2 = string
        L11_2 = L11_2.format
        L12_2 = "%s\\%s"
        L13_2 = L2_2
        L14_2 = L9_2
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        if L10_2 then
          L11_2 = sysio
          L11_2 = L11_2.GetRegValueAsDword
          L12_2 = L10_2
          L13_2 = "FullProfile"
          L11_2 = L11_2(L12_2, L13_2)
          if L11_2 == 1 then
            if L9_2 ~= "" then
              L12_2 = trim
              L13_2 = L9_2
              L12_2 = L12_2(L13_2)
              L12_2 = #L12_2
              if 0 < L12_2 then
                L13_2 = L9_2
                L12_2 = L9_2.lower
                L12_2 = L12_2(L13_2)
                L9_2 = L12_2
                L0_2[L9_2] = 1
                L12_2 = AppendToRollingQueue
                L13_2 = "localUsers"
                L14_2 = L9_2
                L15_2 = 1
                L16_2 = 604800
                L12_2(L13_2, L14_2, L15_2, L16_2)
              end
            end
            L12_2 = sysio
            L12_2 = L12_2.GetRegValueAsString
            L13_2 = L10_2
            L14_2 = "ProfileImagePath"
            L12_2 = L12_2(L13_2, L14_2)
            if L12_2 then
              L14_2 = L12_2
              L13_2 = L12_2.match
              L15_2 = "[^\\]+$"
              L13_2 = L13_2(L14_2, L15_2)
              if L13_2 and L13_2 ~= "" then
                L14_2 = trim
                L15_2 = L13_2
                L14_2 = L14_2(L15_2)
                L14_2 = #L14_2
                if 0 < L14_2 then
                  L15_2 = L13_2
                  L14_2 = L13_2.lower
                  L14_2 = L14_2(L15_2)
                  L13_2 = L14_2
                  L1_2[L13_2] = 1
                  L14_2 = AppendToRollingQueue
                  L15_2 = "localProfiles"
                  L16_2 = L13_2
                  L17_2 = 1
                  L18_2 = 604800
                  L14_2(L15_2, L16_2, L17_2, L18_2)
                end
              end
            end
          end
        end
      end
    end
  end
  L4_2 = L0_2
  L5_2 = L1_2
  return L4_2, L5_2
end

updateLocalProfilesList = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "localUsers"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = GetRollingQueueCount
    L2_2 = "localUsers"
    L1_2 = L1_2(L2_2)
    if 0 == L1_2 then
      L1_2 = updateLocalProfilesList
      L1_2, L2_2 = L1_2()
      L3_2 = L1_2[A0_2]
      if L3_2 then
        L3_2 = true
        return L3_2
      end
    end
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end

isLocalProfileSid = L3_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetRollingQueueKeys
  L1_2 = "localProfiles"
  L0_2 = L0_2(L1_2)
  if L0_2 == nil then
    L1_2 = updateLocalProfilesList
    L1_2, L2_2 = L1_2()
    L0_2 = L2_2
    _ = L1_2
  end
  return L0_2
end

getProfileUserList = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = {}
  L0_2["2fb5b8cc8c2180d80aedb449adaaa118431999a3"] = 0
  L0_2.e2c28e74ecab690d701d0607f0fbbfaed5866b03 = 0
  L0_2["5a87af4ff7b535b6bd8dede9904102e044febccb"] = 0
  L0_2["3b4c664cc8dae08eed20c649d16cf7ddc91d4b8a"] = 0
  L0_2["26a5d0b18940cf045ab8ff65a4041c55ea6e7484"] = 0
  L1_2 = scrubData
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = mp
  L3_2 = L3_2.GetMachineGUID
  L3_2 = L3_2()
  L2_2, L3_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L0_2[L1_2]
  L1_2 = L1_2 ~= nil
  return L1_2
end

isHoneypotMachine = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = getProfileUserList
  L2_2 = L2_2()
  L3_2 = 1000
  L4_2 = ""
  L5_2 = pairs
  L6_2 = L2_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2 in L5_2, L6_2, L7_2 do
    L9_2 = typoDistance
    L10_2 = A0_2
    L11_2 = L8_2
    L12_2 = A1_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    if L3_2 > L9_2 then
      L3_2 = L9_2
      L4_2 = L8_2
    end
  end
  L5_2 = L3_2
  L6_2 = L4_2
  return L5_2, L6_2
end

getLocalProfileTypoDistance = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "localProfiles"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = GetRollingQueueCount
    L2_2 = "localProfiles"
    L1_2 = L1_2(L2_2)
    if 0 == L1_2 then
      L1_2 = updateLocalProfilesList
      L1_2, L2_2 = L1_2()
      L3_2 = L2_2[A0_2]
      if L3_2 then
        L3_2 = true
        return L3_2
      end
    end
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end

isLocalProfileUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = split
  L2_2 = A0_2.utf8p2
  L3_2 = ";"
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = {}
  
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3
    if A0_3 ~= "TN" and A0_3 ~= "Wsn" then
      L2_3 = type
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      if L2_3 == "string" then
        L3_3 = A1_3
        L2_3 = A1_3.lower
        L2_3 = L2_3(L3_3)
        if L2_3 then
          goto lbl_28
        end
      end
    end
    if A0_3 == "TN" or A0_3 == "Wsn" or A0_3 == "TDN" or A0_3 == "Ip" then
      L2_3 = tostring
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      if L2_3 then
        goto lbl_28
      end
    end
    L2_3 = A1_3
    ::lbl_28::
    return L2_3
  end
  
  if L1_2 then
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = pcall
      L10_2 = kvsplit
      L11_2 = L8_2
      L12_2 = ":"
      L13_2 = L2_2
      L14_2 = L3_2
      L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      if not L9_2 then
        L11_2 = error
        L12_2 = L10_2
        L13_2 = A0_2.utf8p2
        L12_2 = L12_2 .. L13_2
        L11_2(L12_2)
      end
    end
  end
  L4_2 = split
  L5_2 = A0_2.utf8p1
  L6_2 = ";"
  L4_2 = L4_2(L5_2, L6_2)
  L1_2 = L4_2
  if L1_2 then
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = pcall
      L10_2 = kvsplit
      L11_2 = L8_2
      L12_2 = ":"
      L13_2 = L2_2
      L14_2 = L3_2
      L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      if not L9_2 then
        L11_2 = error
        L12_2 = L10_2
        L13_2 = A0_2.utf8p1
        L12_2 = L12_2 .. L13_2
        L11_2(L12_2)
      end
    end
  end
  L4_2 = L2_2.TDN
  if L4_2 then
    L4_2 = L2_2.TDN
    if L4_2 ~= "" then
      L4_2 = L2_2.TDN
      L5_2 = L4_2
      L4_2 = L4_2.lower
      L4_2 = L4_2(L5_2)
      L5_2 = "\\"
      L6_2 = L2_2.TN
      L7_2 = L6_2
      L6_2 = L6_2.lower
      L6_2 = L6_2(L7_2)
      L4_2 = L4_2 .. L5_2 .. L6_2
      L2_2.TFUN = L4_2
  end
  else
    L4_2 = L2_2.TN
    L5_2 = L4_2
    L4_2 = L4_2.lower
    L4_2 = L4_2(L5_2)
    L2_2.TFUN = L4_2
  end
  L4_2 = isLocalLogon
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L2_2.Ip = "LT:2"
  end
  return L2_2
end

parseLogonEvent = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = MpCommon
  L1_2 = L1_2.GetCurrentTimeT
  L1_2 = L1_2()
  L2_2 = MpCommon
  L2_2 = L2_2.OverwritePersistContextNoPath
  L3_2 = "RDP-PWC-"
  L4_2 = A0_2.TN
  L3_2 = L3_2 .. L4_2
  L4_2 = {}
  L5_2 = L1_2
  L6_2 = "_"
  L7_2 = A0_2.SDN
  L8_2 = "_"
  L9_2 = A0_2.SUN
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
  L4_2[1] = L5_2
  L5_2 = 315360000
  L2_2(L3_2, L4_2, L5_2)
end

processPasswordChangeEvent = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextNoPath
  L2_2 = "RDP-PWC-"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = str_split
    L3_2 = L1_2
    L4_2 = "_"
    L2_2 = L2_2(L3_2, L4_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = L1_2[1]
  L2_2.time = L3_2
  L3_2 = L1_2[2]
  L2_2.sdn = L3_2
  L3_2 = L1_2[3]
  L2_2.sun = L3_2
  return L2_2
end

getLastPWChangeEvent = L3_1

function L3_1(A0_2)
  local L1_2
  L1_2 = A0_2.LT
  if L1_2 ~= 3 then
    L1_2 = A0_2.LT
    if L1_2 ~= 10 then
      L1_2 = A0_2.LT
    end
  end
  L1_2 = L1_2 == 11
  return L1_2
end

isRemoteLogon = L3_1

function L3_1(A0_2)
  local L1_2
  L1_2 = A0_2.LT
  L1_2 = L1_2 == 2
  return L1_2
end

isLocalLogon = L3_1

function L3_1(A0_2)
  local L1_2
  L1_2 = A0_2.SLId
  if L1_2 ~= 30000000 then
    L1_2 = A0_2.SLId
  end
  L1_2 = L1_2 == 0
  return L1_2
end

isRelevantLogon = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = isRemoteLogon
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = deepCopy
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if A2_2 then
      L4_2 = "username_"
      L5_2 = scrubData
      L6_2 = L3_2.TN
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2 .. L5_2
      L3_2.TN = L4_2
    end
    if A1_2 then
      L4_2 = updateLastUserSuccess
      L5_2 = A0_2
      L4_2(L5_2)
      L4_2 = updateUserLogs
      L5_2 = A0_2
      L4_2(L5_2)
      L4_2 = addToKnownWorkstations
      L5_2 = A0_2.Wsn
      L4_2(L5_2)
      L4_2 = updateKnownIP
      L5_2 = A0_2
      L4_2(L5_2)
      L4_2 = addRQValue
      L5_2 = "RDP-Successful-Counter"
      L6_2 = "counter"
      L7_2 = 1
      L8_2 = 311040000
      L9_2 = 1
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      L4_2 = addRQValue
      L5_2 = "RDP-Ip-Successful-Counter"
      L6_2 = A0_2.Ip
      L7_2 = 1
      L8_2 = 311040000
      L9_2 = 1000
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      L4_2 = addRQValue
      L5_2 = "RDP-WSN-Successful-Counter"
      L6_2 = A0_2.Wsn
      L7_2 = 1
      L8_2 = 311040000
      L9_2 = 1000
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      L4_2 = addRQValue
      L5_2 = "RDP-Event-Success"
      L6_2 = safeJsonSerialize
      L7_2 = L3_2
      L6_2 = L6_2(L7_2)
      L7_2 = 1
      L8_2 = 604800
      L9_2 = 10
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    else
      L4_2 = logUserFailure
      L5_2 = A0_2
      L4_2(L5_2)
      L4_2 = logIPFailure
      L5_2 = A0_2
      L4_2(L5_2)
      L4_2 = decayAndUpdateCounter
      L5_2 = "RDP-Failed-Counter"
      L6_2 = 1
      L7_2 = false
      L8_2 = 2419200
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = addRQValue
      L5_2 = "RDP-IP-Failed-Counter"
      L6_2 = A0_2.Ip
      L7_2 = 1
      L8_2 = 2419200
      L9_2 = 1000
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      L4_2 = addRQValue
      L5_2 = "RDP-Event-Fail"
      L6_2 = safeJsonSerialize
      L7_2 = L3_2
      L6_2 = L6_2(L7_2)
      L7_2 = 1
      L8_2 = 604800
      L9_2 = 10
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    end
  end
end

addLogonEvent = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = addRQValue
  L2_2 = "RDP-F-User"
  L3_2 = A0_2.TFUN
  L4_2 = "-"
  L5_2 = A0_2.Ip
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = 1
  L5_2 = 172800
  L6_2 = 300
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end

logUserFailure = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.TFUN
  L2_2 = A0_2.SubStatus
  if L2_2 ~= 3221225572 then
    L2_2 = scrubData
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = addRQValue
  L3_2 = "RDP-F-IP"
  L4_2 = A0_2.Ip
  L5_2 = "-"
  L6_2 = L1_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = 1
  L6_2 = 172800
  L7_2 = 300
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end

logIPFailure = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-Ws"
  L3_2 = A0_2
  L4_2 = 1
  L5_2 = 31104000
  L6_2 = 1000
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end

addToKnownWorkstations = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-IPs"
  L3_2 = A0_2.Ip
  L4_2 = 1
  L5_2 = 31104000
  L6_2 = 1000
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-IP-Wsn"
  L3_2 = A0_2.Ip
  L4_2 = "-"
  L5_2 = A0_2.Wsn
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = 1
  L5_2 = 31104000
  L6_2 = 1000
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-IP-User"
  L3_2 = A0_2.Ip
  L4_2 = "-"
  L5_2 = A0_2.TFUN
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = 1
  L5_2 = 31104000
  L6_2 = 1000
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end

updateKnownIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-User-Wsn"
  L3_2 = A0_2.TFUN
  L4_2 = "-"
  L5_2 = A0_2.Wsn
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = 1
  L5_2 = 31104000
  L6_2 = 1000
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end

updateUserLogs = L3_1

function L3_1()
  local L0_2, L1_2
  L0_2 = GetRollingQueueKeys
  L1_2 = "RDP-S-IPs"
  return L0_2(L1_2)
end

getAllKnownIPs = L3_1

function L3_1()
  local L0_2, L1_2
  L0_2 = GetRollingQueueKeys
  L1_2 = "FW-IPs"
  return L0_2(L1_2)
end

getAllBlockedIPs = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = IsKeyInRollingQueue
  L3_2 = "RDP-S-IP-User"
  L4_2 = A0_2
  L5_2 = "-"
  L6_2 = A1_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = true
  return L2_2(L3_2, L4_2, L5_2)
end

isKnownUserForIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = tostring
  L2_2 = MpCommon
  L2_2 = L2_2.GetCurrentTimeT
  L2_2, L3_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = addSuccessfulLogonTime
  L3_2 = A0_2.TFUN
  L2_2(L3_2)
end

updateLastUserSuccess = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MpCommon
  L1_2 = L1_2.OverwritePersistContextNoPath
  L2_2 = "RDP-R-User-"
  L3_2 = A0_2.TFUN
  L2_2 = L2_2 .. L3_2
  L3_2 = {}
  L4_2 = tostring
  L5_2 = MpCommon
  L5_2 = L5_2.GetCurrentTimeT
  L5_2 = L5_2()
  L4_2, L5_2 = L4_2(L5_2)
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = 604800
  L1_2(L2_2, L3_2, L4_2)
end

updateLastUserPasswordReset = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueQueryKeyRegex
  L3_2 = "RDP-F-IP"
  L4_2 = A0_2
  L5_2 = "-"
  L4_2 = L4_2 .. L5_2
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 or not L2_2 then
    L3_2 = 0
    return L3_2
  end
  L3_2 = #L2_2
  return L3_2
end

getDistinctTriedUsersForIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueQueryKeyRegex
  L3_2 = "RDP-F-User"
  L4_2 = A0_2
  L5_2 = "-"
  L4_2 = L4_2 .. L5_2
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 or not L2_2 then
    L3_2 = 0
    return L3_2
  end
  L3_2 = #L2_2
  return L3_2
end

getDistinctIpsForUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueQueryMultiKeyRegex
  L4_2 = "RDP-F-IP"
  L5_2 = A0_2
  L6_2 = "-"
  L5_2 = L5_2 .. L6_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 and L3_2 then
    L4_2 = ipairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L1_2
      L11_2 = string
      L11_2 = L11_2.sub
      L12_2 = L8_2.key
      L13_2 = #A0_2
      L13_2 = L13_2 + 2
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2)
    end
  end
  return L1_2
end

getAllIPFailures = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueQueryKeyRegex
  L4_2 = "RDP-F-User"
  L5_2 = A0_2
  L6_2 = "-"
  L5_2 = L5_2 .. L6_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 and L3_2 then
    L4_2 = ipairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L1_2
      L11_2 = string
      L11_2 = L11_2.sub
      L12_2 = L8_2.key
      L13_2 = #A0_2
      L13_2 = L13_2 + 2
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      L9_2(L10_2, L11_2, L12_2, L13_2)
    end
  end
  return L1_2
end

getAllIpFailuresForUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "RDP-S-Ws"
  L3_2 = A0_2
  L4_2 = true
  return L1_2(L2_2, L3_2, L4_2)
end

isKnownWorkstation = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = IsKeyInRollingQueue
  L3_2 = "RDP-S-IP-Wsn"
  L4_2 = A1_2
  L5_2 = "-"
  L6_2 = A0_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = true
  return L2_2(L3_2, L4_2, L5_2)
end

isKnownWorkstationForIP = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = IsKeyInRollingQueue
  L3_2 = "RDP-S-User-Wsn"
  L4_2 = A1_2
  L5_2 = "-"
  L6_2 = A0_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = true
  return L2_2(L3_2, L4_2, L5_2)
end

isKnownWorkstationForUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = computeWorkstationReputation
  L2_2 = A0_2.Wsn
  L3_2 = A0_2.SubStatus
  L3_2 = L3_2 ~= 3221225572
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  L3_2 = L1_2
  L4_2 = L2_2
  return L3_2, L4_2
end

isKnownAttackerWorkstation = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "RDP-S-IPs"
  L3_2 = A0_2
  L4_2 = true
  return L1_2(L2_2, L3_2, L4_2)
end

isKnownIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = getAllKnownIPs
  L1_2 = L1_2()
  L2_2 = 4294967296
  L3_2 = nil
  if L1_2 then
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = computeIPDistance
      L10_2 = A0_2.Ip
      L11_2 = L8_2
      L9_2 = L9_2(L10_2, L11_2)
      if L2_2 > L9_2 then
        L3_2 = L8_2
        L2_2 = L9_2
      end
    end
  else
    L4_2 = error
    L5_2 = "Unable to find any good IPs"
    L4_2(L5_2)
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end

minDistanceToKnownIp = L3_1

function L3_1(A0_2)
  local L1_2
  L1_2 = A0_2.SubStatus
  L1_2 = L1_2 == 3221225572
  return L1_2
end

isInvalidUsername = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = computeUserReputationScore
  L2_2 = A0_2.TN
  L3_2 = A0_2.SubStatus
  L3_2 = L3_2 ~= 3221225572
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  L3_2 = L1_2
  L4_2 = L2_2
  return L3_2, L4_2
end

isTopAbusedUser = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A3_2 then
    A3_2 = 1
  end
  if not A4_2 then
    A4_2 = 0
  end
  L5_2 = MpCommon
  L5_2 = L5_2.GetCurrentTimeT
  L5_2 = L5_2()
  L6_2 = math_floor
  L7_2 = L5_2 - A0_2
  L7_2 = L7_2 / A2_2
  L6_2 = L6_2(L7_2)
  if L6_2 == 0 then
    L7_2 = A0_2
    L8_2 = A1_2
    return L7_2, L8_2
  else
    L7_2 = A2_2 * L6_2
    L7_2 = A0_2 + L7_2
    if A3_2 ~= 1 then
      L8_2 = math_pow
      L9_2 = A3_2
      L10_2 = L6_2 + 1
      L8_2 = L8_2(L9_2, L10_2)
      L8_2 = 1 - L8_2
      L9_2 = 1 - A3_2
      L8_2 = L8_2 / L9_2
      L8_2 = L8_2 - 1
      L8_2 = A4_2 * L8_2
      if L8_2 then
        goto lbl_36
      end
    end
    L8_2 = A4_2 * L6_2
    ::lbl_36::
    L9_2 = math_floor
    L10_2 = math_pow
    L11_2 = A3_2
    L12_2 = L6_2
    L10_2 = L10_2(L11_2, L12_2)
    L10_2 = A1_2 * L10_2
    L10_2 = L10_2 + L8_2
    L9_2 = L9_2(L10_2)
    L10_2 = L7_2
    L11_2 = math_floor
    L12_2 = L9_2
    L11_2, L12_2 = L11_2(L12_2)
    return L10_2, L11_2, L12_2
  end
end

computeDecay = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "DecayingCounter_"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  if A1_2 then
    L3_2 = GetRollingQueue
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == nil then
      L3_2 = 0
      L4_2 = 0
      return L3_2, L4_2
    end
    L3_2 = MpCommon
    L3_2 = L3_2.RollingQueueSumOfValues
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == nil then
      L4_2 = 0
      L5_2 = 0
      return L4_2, L5_2
    end
    L4_2 = L3_2.sum
    L5_2 = L3_2.age_secs
    return L4_2, L5_2
  else
    L3_2 = MpCommon
    L3_2 = L3_2.AtomicCounterValueEx
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L4_2 = 0
      L5_2 = 0
      return L4_2, L5_2
    end
    L4_2 = L3_2.count
    L5_2 = MpCommon
    L5_2 = L5_2.GetCurrentTimeT
    L5_2 = L5_2()
    L6_2 = L3_2.update_time
    L5_2 = L5_2 - L6_2
    return L4_2, L5_2
  end
end

getCounterValue = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A3_2 then
    A3_2 = 604800
  end
  if not A4_2 then
    A4_2 = 100
  end
  L5_2 = "DecayingCounter_"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  L6_2 = A1_2
  if A2_2 then
    L7_2 = GetRollingQueue
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L7_2 == nil then
      L8_2 = pcall
      L9_2 = MpCommon
      L9_2 = L9_2.RollingQueueCreate
      L10_2 = L5_2
      L11_2 = A4_2
      L12_2 = A3_2
      L13_2 = 0
      L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      if not L8_2 then
        L10_2 = nil
        return L10_2
      end
    end
    L8_2 = MpCommon
    L8_2 = L8_2.RollingQueueSumOfValues
    L9_2 = L5_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = L8_2.sum
      L6_2 = L9_2 + A1_2
    end
    L9_2 = AppendToRollingQueue
    L10_2 = L5_2
    L11_2 = A0_2
    L12_2 = A1_2
    L13_2 = A3_2
    L14_2 = A4_2
    L15_2 = 0
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  else
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.AtomicCounterAdd
    L9_2 = L5_2
    L10_2 = A1_2
    L7_2, L8_2 = L7_2(L8_2, L9_2, L10_2)
    if not L7_2 then
      L9_2 = MpCommon
      L9_2 = L9_2.AtomicCounterSet
      L10_2 = L5_2
      L11_2 = A1_2
      L12_2 = A3_2
      L13_2 = 10
      L14_2 = 1
      L15_2 = 0
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    else
      L6_2 = A1_2 + L8_2
    end
  end
  return L6_2
end

decayAndUpdateCounter = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A2_2 then
    A2_2 = 604800
  end
  if not A3_2 then
    A3_2 = 100
  end
  L4_2 = "DecayingCounter_"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  if A1_2 then
    L5_2 = pcall
    L6_2 = MpCommon
    L6_2 = L6_2.RollingQueueErase
    L7_2 = L4_2
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L7_2 = MpCommon
      L7_2 = L7_2.RollingQueueCreate
      L8_2 = L4_2
      L9_2 = A3_2
      L10_2 = A2_2
      L11_2 = 0
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = true
      return L7_2
    end
  else
    L5_2 = pcall
    L6_2 = MpCommon
    L6_2 = L6_2.AtomicCounterErase
    L7_2 = L4_2
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L7_2 = MpCommon
      L7_2 = L7_2.AtomicCounterSet
      L8_2 = L4_2
      L9_2 = 0
      L10_2 = A2_2
      L11_2 = 10
      L12_2 = 1
      L13_2 = 0
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L7_2 = true
      return L7_2
    end
  end
  L5_2 = false
  return L5_2
end

resetCounter = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A2_2 then
    A2_2 = 1
  end
  if not A3_2 then
    A3_2 = 604800
  end
  if not A4_2 then
    A4_2 = 100
  end
  L5_2 = pcall
  L6_2 = MpCommon
  L6_2 = L6_2.RollingQueueQueryKey
  L7_2 = A0_2
  L8_2 = A1_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 and L6_2 then
    L7_2 = L6_2.value
    A2_2 = L7_2 + A2_2
  end
  L7_2 = AppendToRollingQueue
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A4_2
  L13_2 = 1
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  return A2_2
end

addRQValue = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = "BruteForceProtectionCookieV3"
  L1_2 = GetAtomicCounter
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = MpCommon
    L2_2 = L2_2.GetCurrentTimeT
    L2_2 = L2_2()
    L1_2 = L2_2
    L2_2 = pcall
    L3_2 = MpCommon
    L3_2 = L3_2.AtomicCounterSet
    L4_2 = L0_2
    L5_2 = L1_2
    L6_2 = 3110400000
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = GetRollingQueueKeyValue
  L3_2 = "RDP-Successful-Counter"
  L4_2 = "counter"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = MpCommon
    L2_2 = L2_2.GetCurrentTimeT
    L2_2 = L2_2()
    L2_2 = L2_2 - L1_2
    if 1209600 < L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = false
  return L2_2
end

checkBruteForceCookie = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = {}
  L0_2.status = 0
  L0_2.learning_mode = true
  L0_2.block_local_ip = false
  L1_2 = nil
  L2_2 = nil
  L3_2 = MpCommon
  L3_2 = L3_2.GetBehavioralNetworkBlocksSettings
  if L3_2 then
    L3_2 = pcall
    L4_2 = MpCommon
    L4_2 = L4_2.GetBehavioralNetworkBlocksSettings
    L5_2 = 1
    L3_2, L4_2 = L3_2(L4_2, L5_2)
    L2_2 = L4_2
    L1_2 = L3_2
  end
  if L1_2 and L2_2 then
    L3_2 = L2_2.State
    if L3_2 then
      L3_2 = L2_2.State
      L0_2.status = L3_2
    else
      L0_2.status = 0
    end
    L3_2 = L2_2.Exclusions
    if L3_2 then
      L3_2 = L2_2.Exclusions
      L0_2.ip_exclusion_list = L3_2
    end
    L3_2 = L2_2.MaxTimeout
    if L3_2 then
      L3_2 = L2_2.MaxTimeout
      L0_2.MaxTimeout = L3_2
    end
    L3_2 = L2_2.AggressiveLevel
    if L3_2 then
      L3_2 = L2_2.AggressiveLevel
      L0_2.AggressiveLevel = L3_2
    end
    L3_2 = L2_2.Plugins
    if L3_2 then
      L3_2 = L2_2.Plugins
      L0_2.Plugins = L3_2
      L3_2 = L0_2.Plugins
      if L3_2 then
        L3_2 = mp
        L3_2 = L3_2.bitand
        L4_2 = L0_2.Plugins
        L5_2 = 2
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 == 2 then
          L0_2.learning_mode = false
        end
        L3_2 = mp
        L3_2 = L3_2.bitand
        L4_2 = L0_2.Plugins
        L5_2 = 1
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 == 1 then
          L0_2.block_local_ip = true
        end
      end
    end
  end
  L3_2 = L0_2.ip_exclusion_list
  if L3_2 then
    L3_2 = split
    L4_2 = L0_2.ip_exclusion_list
    L5_2 = ","
    L3_2 = L3_2(L4_2, L5_2)
    L0_2.ip_exclusion_list = L3_2
  end
  return L0_2
end

getBruteForceConfig = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A1_2 then
    L3_2 = {}
    A1_2 = L3_2
  end
  if not A2_2 then
    A2_2 = ""
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumValues
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = pairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = A1_2[L9_2]
        if not L10_2 then
          A1_2[L9_2] = 0
          L10_2 = A2_2
          L11_2 = ","
          L12_2 = L9_2
          A2_2 = L10_2 .. L11_2 .. L12_2
        end
      end
    end
  end
  L4_2 = A1_2
  L5_2 = A2_2
  return L4_2, L5_2
end

readDefenderIPExclusion = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "DefenderExclusion"
  L3_2 = "IpAddresses"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = split
    L3_2 = L1_2
    L4_2 = ","
    L2_2 = L2_2(L3_2, L4_2)
    L0_2 = L2_2
    L2_2 = convert_to_hashtable
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    L0_2 = L2_2
  else
    L2_2 = readDefenderIPExclusion
    L3_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\IpAddresses"
    L2_2, L3_2 = L2_2(L3_2)
    L1_2 = L3_2
    L0_2 = L2_2
    L2_2 = readDefenderIPExclusion
    L3_2 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\IpAddresses"
    L4_2 = L0_2
    L5_2 = L1_2
    L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
    L1_2 = L3_2
    L0_2 = L2_2
    L2_2 = AppendToRollingQueue
    L3_2 = "DefenderExclusion"
    L4_2 = "IpAddresses"
    L5_2 = L1_2
    L6_2 = 3600
    L7_2 = 2
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  return L0_2
end

getDefenderIPExclusion = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A1_2 then
    L3_2 = {}
    A1_2 = L3_2
  end
  L3_2 = {}
  if A2_2 then
    L4_2 = getDefenderIPExclusion
    L4_2 = L4_2()
    L3_2 = L4_2
  end
  L4_2 = convert_to_hashtable
  L5_2 = A1_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = pairs
    L6_2 = L4_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2 in L5_2, L6_2, L7_2 do
      L9_2 = split
      L10_2 = L8_2
      L11_2 = "/"
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = L9_2[1]
      L11_2 = L9_2[2]
      if L11_2 then
        L12_2 = pcall
        L13_2 = isIPInNetmaskRange
        L14_2 = A0_2
        L15_2 = L10_2
        L16_2 = L11_2
        L12_2, L13_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
        if L12_2 and L13_2 then
          L14_2 = true
          return L14_2
        end
      elseif L8_2 == A0_2 then
        L12_2 = true
        return L12_2
      end
    end
  end
  L5_2 = false
  return L5_2
end

isIPInExclusionList = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "DefenderExclusion"
  L3_2 = "IpAddresses"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = A0_2
  else
    L2_2 = L1_2
    L3_2 = ","
    L4_2 = A0_2
    L1_2 = L2_2 .. L3_2 .. L4_2
  end
  L2_2 = AppendToRollingQueue
  L3_2 = "DefenderExclusion"
  L4_2 = "IpAddresses"
  L5_2 = L1_2
  L6_2 = 3600
  L7_2 = 2
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end

addDefenderIPExclusion = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetRollingQueueKeyValue
  L3_2 = "DefenderExclusion"
  L4_2 = "IpAddresses"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = split
    L4_2 = L2_2
    L5_2 = ","
    L3_2 = L3_2(L4_2, L5_2)
    L1_2 = L3_2
    L2_2 = ""
    L3_2 = pairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      if L7_2 ~= A0_2 then
        L8_2 = L2_2
        L9_2 = ","
        L10_2 = L7_2
        L2_2 = L8_2 .. L9_2 .. L10_2
      end
    end
    L3_2 = AppendToRollingQueue
    L4_2 = "DefenderExclusion"
    L5_2 = "IpAddresses"
    L6_2 = L2_2
    L7_2 = 3600
    L8_2 = 2
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  end
end

removeDefenderIPExclusion = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = scrubData
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = "F0000"
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = L1_2
  L5_2 = 6
  L3_2 = L3_2(L4_2, L5_2)
  L1_2 = L2_2 .. L3_2
  L2_2 = 220
  L3_2 = MpCommon
  L3_2 = L3_2.SNidSearch
  L4_2 = L2_2
  L5_2 = L1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 and L4_2 then
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = L4_2
    L7_2 = 3
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
    L5_2 = MpCommon
    L5_2 = L5_2.Base64Decode
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
    L6_2 = L4_2
    L5_2 = L4_2.gmatch
    L7_2 = "I=(%d+)|V=(%d+)|S=(%d+)"
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
    for L8_2, L9_2, L10_2 in L5_2, L6_2, L7_2 do
      L11_2 = true
      L12_2 = tonumber
      L13_2 = L8_2
      L12_2 = L12_2(L13_2)
      L13_2 = tonumber
      L14_2 = L9_2
      L13_2 = L13_2(L14_2)
      L14_2 = tonumber
      L15_2 = L10_2
      L14_2, L15_2 = L14_2(L15_2)
      return L11_2, L12_2, L13_2, L14_2, L15_2
    end
  end
  L5_2 = false
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  return L5_2, L6_2, L7_2, L8_2
end

getWorkstationReputation = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = scrubData
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = "00000"
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = L1_2
  L5_2 = 6
  L3_2 = L3_2(L4_2, L5_2)
  L1_2 = L2_2 .. L3_2
  L2_2 = 220
  L3_2 = MpCommon
  L3_2 = L3_2.SNidSearch
  L4_2 = L2_2
  L5_2 = L1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 and L4_2 then
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = L4_2
    L7_2 = 3
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
    L5_2 = MpCommon
    L5_2 = L5_2.Base64Decode
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
    L6_2 = L4_2
    L5_2 = L4_2.gmatch
    L7_2 = "I=(%d+)|V=(%d+)|S=(%d+)"
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
    for L8_2, L9_2, L10_2 in L5_2, L6_2, L7_2 do
      L11_2 = true
      L12_2 = tonumber
      L13_2 = L8_2
      L12_2 = L12_2(L13_2)
      L13_2 = tonumber
      L14_2 = L9_2
      L13_2 = L13_2(L14_2)
      L14_2 = tonumber
      L15_2 = L10_2
      L14_2, L15_2 = L14_2(L15_2)
      return L11_2, L12_2, L13_2, L14_2, L15_2
    end
  end
  L5_2 = false
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  return L5_2, L6_2, L7_2, L8_2
end

getUserReputation = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if not A2_2 then
    A2_2 = 50
  end
  L3_2 = 0
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = getWorkstationReputation
  L9_2 = A0_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  L13_2 = A0_2
  L12_2 = A0_2.lower
  L12_2 = L12_2(L13_2)
  if A0_2 ~= L12_2 then
    L13_2 = getWorkstationReputation
    L14_2 = L12_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    L7_2 = L16_2
    L6_2 = L15_2
    L5_2 = L14_2
    L4_2 = L13_2
    if L4_2 then
      if L8_2 then
        L13_2 = math_round
        L14_2 = L9_2 + L5_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_31
          L9_2 = L13_2 or L9_2
        end
      end
      L9_2 = L5_2
      ::lbl_31::
      if L8_2 then
        L13_2 = math_round
        L14_2 = L10_2 + L6_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_40
          L10_2 = L13_2 or L10_2
        end
      end
      L10_2 = L6_2
      ::lbl_40::
      if L8_2 then
        L13_2 = math_round
        L14_2 = L11_2 + L7_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_49
          L11_2 = L13_2 or L11_2
        end
      end
      L11_2 = L7_2
    end
  end
  ::lbl_49::
  if L8_2 or L4_2 then
    if A1_2 then
      L13_2 = math_ln
      L14_2 = L9_2 + L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = math_ln
      L15_2 = L11_2
      L14_2 = L14_2(L15_2)
      L13_2 = L13_2 - L14_2
      L13_2 = A2_2 * L13_2
      L3_2 = L13_2 / 21
    else
      L13_2 = math_ln
      L14_2 = L9_2 + L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = math_ln
      L15_2 = L11_2
      L14_2 = L14_2(L15_2)
      L13_2 = L13_2 - L14_2
      L13_2 = A2_2 * L13_2
      L3_2 = L13_2 / 19
    end
  end
  L13_2 = L9_2 + L10_2
  L13_2 = 0 < L13_2 and L11_2 == 0
  L14_2 = math_max
  L15_2 = 0
  L16_2 = math_round
  L17_2 = L3_2
  L16_2, L17_2 = L16_2(L17_2)
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2, L16_2, L17_2)
  return L13_2, L14_2, L15_2, L16_2, L17_2
end

computeWorkstationReputation = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if not A2_2 then
    A2_2 = 50
  end
  L3_2 = 0
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = getUserReputation
  L9_2 = A0_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  L13_2 = A0_2
  L12_2 = A0_2.lower
  L12_2 = L12_2(L13_2)
  if A0_2 ~= L12_2 then
    L13_2 = getUserReputation
    L14_2 = L12_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    L7_2 = L16_2
    L6_2 = L15_2
    L5_2 = L14_2
    L4_2 = L13_2
    if L4_2 then
      if L8_2 then
        L13_2 = math_round
        L14_2 = L9_2 + L5_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_31
          L9_2 = L13_2 or L9_2
        end
      end
      L9_2 = L5_2
      ::lbl_31::
      if L8_2 then
        L13_2 = math_round
        L14_2 = L10_2 + L6_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_40
          L10_2 = L13_2 or L10_2
        end
      end
      L10_2 = L6_2
      ::lbl_40::
      if L8_2 then
        L13_2 = math_round
        L14_2 = L11_2 + L7_2
        L14_2 = L14_2 / 2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_49
          L11_2 = L13_2 or L11_2
        end
      end
      L11_2 = L7_2
    end
  end
  ::lbl_49::
  if L8_2 or L4_2 then
    if A1_2 then
      L13_2 = math_ln
      L14_2 = L9_2 + L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = math_ln
      L15_2 = L11_2
      L14_2 = L14_2(L15_2)
      L13_2 = L13_2 - L14_2
      L13_2 = A2_2 * L13_2
      L3_2 = L13_2 / 21
    else
      L13_2 = math_ln
      L14_2 = L9_2 + L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = math_ln
      L15_2 = L11_2
      L14_2 = L14_2(L15_2)
      L13_2 = L13_2 - L14_2
      L13_2 = A2_2 * L13_2
      L3_2 = L13_2 / 19
    end
  end
  L13_2 = L9_2 + L10_2
  L13_2 = 0 < L13_2
  L14_2 = math_max
  L15_2 = 0
  L16_2 = math_round
  L17_2 = L3_2
  L16_2, L17_2 = L16_2(L17_2)
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2, L16_2, L17_2)
  return L13_2, L14_2, L15_2, L16_2, L17_2
end

computeUserReputationScore = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = {}
  L2_2 = 0
  L3_2 = tonumber
  L4_2 = GetRollingQueueKeyValue
  L5_2 = "RDP_Ip"
  L6_2 = A0_2.Ip
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = tonumber
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP_Usr"
  L7_2 = A0_2.TFUN
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L3_2 then
    L5_2 = tonumber
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if L5_2 and 100 <= L5_2 then
      L2_2 = 1
    end
  end
  L5_2 = {}
  L5_2.IpScore = L3_2
  L5_2.UserScore = L4_2
  L5_2.case = L2_2
  L6_2 = L2_2
  L7_2 = L5_2
  return L6_2, L7_2
end

analyzeSuccess = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A1_2 then
    A1_2 = 7200
  end
  L2_2 = GetRollingQueueCount
  L3_2 = "FW-IPs"
  L2_2 = L2_2(L3_2)
  if L2_2 == 500 then
    L2_2 = AppendToRollingQueue
    L3_2 = "FW-IPs-Extended"
    L4_2 = A0_2
    L5_2 = 1
    L6_2 = A1_2
    L7_2 = 1000
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  else
    L2_2 = AppendToRollingQueue
    L3_2 = "FW-IPs"
    L4_2 = A0_2
    L5_2 = 1
    L6_2 = A1_2
    L7_2 = 500
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end

blockIP = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = 7200
  end
  L2_2 = MpCommon
  L2_2 = L2_2.SetPersistContextNoPath
  L3_2 = "FW-Usrs"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end

remediateRDPUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsKeyInRollingQueue
  L2_2 = "FW-IPs"
  L3_2 = A0_2
  L4_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    L1_2 = IsKeyInRollingQueue
    L2_2 = "FW-IPs-Extended"
    L3_2 = A0_2
    L4_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2)
  end
  return L1_2
end

isBlockedIP = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = MpCommon
  L1_2 = L1_2.QueryPersistContextNoPath
  L2_2 = "FW-Usrs"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = false
  return L1_2
end

isBlockedUser = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = AppendToRollingQueue
  L2_2 = "RDP-S-User"
  L3_2 = A0_2
  L4_2 = tostring
  L5_2 = MpCommon
  L5_2 = L5_2.GetCurrentTimeT
  L5_2, L6_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = 31104000
  L6_2 = 100
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end

addSuccessfulLogonTime = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "RDP-S-User"
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

getLastSuccessfulLogonTime = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueQueryKey
  L3_2 = A0_2
  L4_2 = "evidence"
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    return L1_2
  end
  L3_2 = bm
  L3_2 = L3_2.add_related_string
  L4_2 = "BFELEN"
  L5_2 = ""
  L6_2 = L2_2.value
  L6_2 = #L6_2
  L5_2 = L5_2 .. L6_2
  L6_2 = bm
  L6_2 = L6_2.RelatedStringBMReport
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = bm
  L3_2 = L3_2.add_related_string
  L4_2 = "BFE"
  L5_2 = L2_2.value
  L6_2 = bm
  L6_2 = L6_2.RelatedStringBMReport
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = pcall
  L4_2 = MpCommon
  L4_2 = L4_2.RollingQueueErase
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
  return L1_2
end

reportBFEvidenceFromRQ = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = {}
  L1_2 = "RDP-Ip-Successful-Counter"
  L2_2 = "RDP-WSN-Successful-Counter"
  L3_2 = "RDP-S-User-Wsn"
  L4_2 = "RDP-S-IPs"
  L5_2 = "RDP-S-IP-Wsn"
  L6_2 = "RDP-S-IP-User"
  L7_2 = "RDP-S-Ws"
  L8_2 = "RDP-Ip-Failed-Counter"
  L9_2 = "RDP-IP-Failed-Counter"
  L10_2 = "RDP-F-User"
  L11_2 = "RDP-F-IP"
  L12_2 = "RDP_Ip"
  L13_2 = "RDP_Usr"
  L14_2 = "RDP_blocked_IP"
  L15_2 = "FW-IPs"
  L16_2 = "RDP-S-User"
  L17_2 = "RDP-Event-Success"
  L18_2 = "RDP-Event-Fail"
  L19_2 = "RDP-Successful-Counter"
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  L0_2[10] = L10_2
  L0_2[11] = L11_2
  L0_2[12] = L12_2
  L0_2[13] = L13_2
  L0_2[14] = L14_2
  L0_2[15] = L15_2
  L0_2[16] = L16_2
  L0_2[17] = L17_2
  L0_2[18] = L18_2
  L0_2[19] = L19_2
  L1_2 = {}
  L2_2 = "BruteForceProtectionCookieV3"
  L3_2 = "RDP-Successful-Counter"
  L4_2 = "RDP-Failed-Counter"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L2_2 = {}
  L3_2 = "BruteForceProtectionCookieV3"
  L4_2 = "RDP-Successful-Counter"
  L5_2 = "FW-Usrs"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L3_2 = ipairs
  L4_2 = L0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.RollingQueueErase
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.AtomicCounterErase
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.OverwritePersistContextNoPath
    L10_2 = L7_2
    L11_2 = {}
    L12_2 = 1
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
end

cleanBruteForceResource = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L1_2 = parseLogonEvent
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = getIpAddressClass
  L3_2 = L1_2.Ip
  L2_2 = L2_2(L3_2)
  if L2_2 == 2 or L2_2 == 8 then
    return
  end
  L3_2 = GetRollingQueueCount
  L4_2 = "RDP-Ip-Successful-Counter"
  L3_2 = L3_2(L4_2)
  if 1000 <= L3_2 then
    return
  end
  L3_2 = getBruteForceConfig
  L3_2 = L3_2()
  L4_2 = L3_2.status
  if L4_2 == 4 then
    return
  end
  L4_2 = IsKeyInRollingQueue
  L5_2 = "BruteForceProtection-Cloud-Config"
  L6_2 = "signature_disable"
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    return
  end
  L4_2 = true
  L5_2 = isHoneypotMachine
  L5_2 = L5_2()
  if L5_2 then
    L4_2 = false
  end
  L5_2 = checkBruteForceCookie
  L5_2()
  L5_2 = isRelevantLogon
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = addLogonEvent
    L6_2 = L1_2
    L7_2 = true
    L8_2 = L4_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = analyzeSuccess
    L6_2 = L1_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = tonumber
    L8_2 = GetRollingQueueKeyValue
    L9_2 = "RDP-Ip-Successful-Counter"
    L10_2 = L1_2.Ip
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    if L7_2 ~= 1 then
      L8_2 = GetRollingQueueKeyValue
      L9_2 = "BruteForceCloudQueryHistory"
      L10_2 = L1_2.Ip
      L8_2 = L8_2(L9_2, L10_2)
      if not L8_2 then
        L7_2 = 1
      end
    end
    L8_2 = mp
    L8_2 = L8_2.bitand
    L9_2 = L5_2
    L10_2 = 1
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 == 1 or L7_2 == 1 then
      L8_2 = getRDPTelemetryData
      L9_2 = L6_2
      L10_2 = L1_2
      L11_2 = L4_2
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L8_2.ip_address_class = L2_2
      if L2_2 == 1 then
        L9_2 = L3_2.block_local_ip
        if L9_2 == false then
          return
      end
      elseif L2_2 ~= 3 then
        L8_2.TAG = "NOLOOKUP"
      end
      L9_2 = GetRollingQueueKeyValue
      L10_2 = "SuccessCloudCallProcessingQueue"
      L11_2 = L1_2.Ip
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 == "1" then
        L9_2 = addRQValue
        L10_2 = "BF-HighVolumeRequest"
        L11_2 = L1_2.Ip
        L12_2 = 1
        L13_2 = 86400
        L14_2 = 1000
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        return
      else
        L9_2 = AppendToRollingQueue
        L10_2 = "SuccessCloudCallProcessingQueue"
        L11_2 = L1_2.Ip
        L12_2 = 1
        L13_2 = 300
        L14_2 = 1000
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      end
      L9_2 = AppendToRollingQueue
      L10_2 = "BruteForceCloudQueryHistory"
      L11_2 = L1_2.Ip
      L12_2 = 0
      L13_2 = 604800
      L14_2 = 1000
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L8_2.CONTEXT_SOURCE = "LBFS"
      L9_2 = SafeGetUrlReputation
      L10_2 = {}
      L11_2 = L1_2.Ip
      L10_2[1] = L11_2
      L11_2 = L8_2
      L12_2 = false
      L13_2 = 4000
      L14_2 = false
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L10_2 = nil
      L11_2 = nil
      L12_2 = nil
      L13_2 = nil
      L14_2 = nil
      L15_2 = L9_2.urls
      L16_2 = L1_2.Ip
      L15_2 = L15_2[L16_2]
      if L15_2 then
        L15_2 = L9_2.urls
        L16_2 = L1_2.Ip
        L15_2 = L15_2[L16_2]
        L10_2 = L15_2.determination
        L15_2 = L9_2.urls
        L16_2 = L1_2.Ip
        L15_2 = L15_2[L16_2]
        L11_2 = L15_2.confidence
        L15_2 = L9_2.urls
        L16_2 = L1_2.Ip
        L15_2 = L15_2[L16_2]
        L15_2 = L15_2.context
        L12_2 = L15_2.source
        L15_2 = L9_2.urls
        L16_2 = L1_2.Ip
        L15_2 = L15_2[L16_2]
        L15_2 = L15_2.context
        L13_2 = L15_2.signature_disable_ttl
        L15_2 = L9_2.urls
        L16_2 = L1_2.Ip
        L15_2 = L15_2[L16_2]
        L15_2 = L15_2.context
        L14_2 = L15_2.clean_bf_resources
        if L13_2 then
          L15_2 = AppendToRollingQueue
          L16_2 = "BruteForceProtection-Cloud-Config"
          L17_2 = "signature_disable"
          L18_2 = L13_2
          L19_2 = tonumber
          L20_2 = L13_2
          L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L19_2(L20_2)
          L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
        end
        if L14_2 then
          L15_2 = cleanBruteForceResource
          L15_2()
          return
        end
      else
        L15_2 = L9_2.error
        if L15_2 == 3 then
          L15_2 = addRQValue
          L16_2 = "BF-FailedCloudCalls"
          L17_2 = "Counter"
          L18_2 = 1
          L19_2 = 86400
          L20_2 = 10
          L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
          L15_2 = AppendToRollingQueue
          L16_2 = "BF-FailedCloudCalls"
          L17_2 = "LastError"
          L18_2 = L9_2.err_msg
          L19_2 = 86400
          L20_2 = 10
          L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
        end
      end
      L15_2 = AppendToRollingQueue
      L16_2 = "SuccessCloudCallProcessingQueue"
      L17_2 = L1_2.Ip
      L18_2 = 0
      L19_2 = 1
      L20_2 = 1000
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
      if L10_2 == 2 and L12_2 == "BruteforceReputationLookup" and 70 <= L11_2 then
        L15_2 = {}
        L16_2 = L1_2.Ip
        L15_2.IP = L16_2
        L16_2 = L1_2.Wsn
        L15_2.WorkStationName = L16_2
        L15_2.CONTEXT_SOURCE = "LBFS"
        L16_2 = L1_2.TN
        L15_2.Username = L16_2
        L16_2 = L1_2.TDN
        L15_2.DomainName = L16_2
        L16_2 = nil
        L17_2 = {}
        L18_2 = 180
        L19_2 = 900
        L20_2 = 3600
        L21_2 = 21600
        L22_2 = 86400
        L23_2 = 604800
        L17_2[1] = L18_2
        L17_2[2] = L19_2
        L17_2[3] = L20_2
        L17_2[4] = L21_2
        L17_2[5] = L22_2
        L17_2[6] = L23_2
        L18_2 = addRQValue
        L19_2 = "RDP_blocked_IP"
        L20_2 = L1_2.Ip
        L21_2 = 1
        L22_2 = 604800
        L23_2 = 1000
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
        L19_2 = math_min
        L20_2 = 5
        L21_2 = L18_2
        L19_2 = L19_2(L20_2, L21_2)
        L18_2 = L19_2
        if L11_2 == 100 then
          L19_2 = math_max
          L20_2 = L17_2[L18_2]
          L21_2 = L17_2[3]
          L19_2 = L19_2(L20_2, L21_2)
          L16_2 = L19_2
        else
          L16_2 = L17_2[L18_2]
        end
        L19_2 = L3_2.MaxTimeout
        if L19_2 then
          L19_2 = L3_2.MaxTimeout
          if L19_2 ~= 0 then
            L19_2 = math_min
            L20_2 = L3_2.MaxTimeout
            L21_2 = L16_2
            L19_2 = L19_2(L20_2, L21_2)
            L16_2 = L19_2
          end
        end
        L19_2 = L3_2.AggressiveLevel
        if L19_2 ~= 0 or L11_2 ~= 100 then
          L19_2 = L3_2.AggressiveLevel
          if L19_2 ~= 1 or not (70 <= L11_2) then
            L19_2 = L3_2.AggressiveLevel
            if L19_2 ~= 2 then
              goto lbl_286
            end
          end
        end
        L19_2 = L3_2.status
        if L19_2 == 1 then
          L19_2 = MpCommon
          L19_2 = L19_2.AddBlockingFirewallRule
          L20_2 = L1_2.Ip
          L21_2 = L16_2
          L22_2 = true
          L19_2(L20_2, L21_2, L22_2)
        end
        L19_2 = bm
        L19_2 = L19_2.trigger_sig
        L20_2 = "BruteForceDetectionAdditionalInfo"
        L21_2 = safeJsonSerialize
        L22_2 = L15_2
        L21_2, L22_2, L23_2, L24_2, L25_2 = L21_2(L22_2)
        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
        ::lbl_286::
        L19_2 = AppendToRollingQueue
        L20_2 = "RDP-Ip-Successful-Counter"
        L21_2 = L1_2.Ip
        L22_2 = 0
        L23_2 = 604800
        L24_2 = 1000
        L25_2 = 1
        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
        L19_2 = AppendToRollingQueue
        L20_2 = "RDP-WSN-Successful-Counter"
        L21_2 = L1_2.Ip
        L22_2 = 0
        L23_2 = 604800
        L24_2 = 1000
        L25_2 = 1
        L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
      else
        L15_2 = L6_2.IpScore
        if L15_2 then
          L15_2 = L6_2.IpScore
          if 0 < L15_2 then
            L15_2 = AppendToRollingQueue
            L16_2 = "RDP_Ip"
            L17_2 = L1_2.Ip
            L18_2 = 0
            L19_2 = 604800
            L20_2 = 1000
            L21_2 = 1
            L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
            L15_2 = AppendToRollingQueue
            L16_2 = "RDP_Usr"
            L17_2 = L1_2.TFUN
            L18_2 = 0
            L19_2 = 604800
            L20_2 = 1000
            L21_2 = 1
            L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
            L15_2 = AppendToRollingQueue
            L16_2 = "RDP_blocked_IP"
            L17_2 = L1_2.Ip
            L18_2 = 0
            L19_2 = 604800
            L20_2 = 1000
            L21_2 = 1
            L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
          end
        end
      end
    end
  end
  return
end

checkLogonSuccessEvent = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  
  function L1_2(A0_3, ...)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = {}
    L3_3 = pcall
    L4_3 = A0_3
    L5_3 = ...
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L3_3 = L2_3[1]
    if not L3_3 then
      L3_3 = error
      L4_3 = L2_3[2]
      L3_3(L4_3)
    end
    L3_3 = table_unpack
    L4_3 = L2_3
    L5_3 = 2
    return L3_3(L4_3, L5_3)
  end
  
  longCall = L1_2
  L1_2 = longCall
  L2_2 = parseLogonEvent
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = longCall
  L3_2 = getIpAddressClass
  L4_2 = L1_2.Ip
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == 2 or L2_2 == 8 then
    return
  end
  L3_2 = GetRollingQueueCount
  L4_2 = "RDP-Ip-Successful-Counter"
  L3_2 = L3_2(L4_2)
  if not (1000 <= L3_2) then
    L3_2 = GetRollingQueueCount
    L4_2 = "FW-IPs-Extended"
    L3_2 = L3_2(L4_2)
    if not (1000 <= L3_2) then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = longCall
  L4_2 = getBruteForceConfig
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.status
  if L4_2 == 4 then
    return
  end
  L4_2 = IsKeyInRollingQueue
  L5_2 = "BruteForceProtection-Cloud-Config"
  L6_2 = "signature_disable"
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    return
  end
  L4_2 = true
  L5_2 = longCall
  L6_2 = isHoneypotMachine
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L4_2 = false
  end
  L5_2 = checkBruteForceCookie
  L5_2()
  L5_2 = L3_2.status
  if L5_2 ~= 0 then
    L5_2 = L3_2.status
    if L5_2 ~= 2 then
      goto lbl_62
    end
  end
  L5_2 = isBlockedIP
  L6_2 = L1_2.Ip
  L5_2 = L5_2(L6_2)
  if L5_2 then
    return
  end
  ::lbl_62::
  L5_2 = isRelevantLogon
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    if L2_2 ~= 1 then
      L5_2 = isKnownIP
      L6_2 = L1_2.Ip
      L5_2 = L5_2(L6_2)
      if L5_2 then
        return
      end
    end
    L5_2 = longCall
    L6_2 = isIPInExclusionList
    L7_2 = L1_2.Ip
    L8_2 = L3_2.ip_exclusion_list
    L9_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if L5_2 then
      return
    end
    L5_2 = longCall
    L6_2 = addLogonEvent
    L7_2 = L1_2
    L8_2 = false
    L9_2 = L4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = analyzeFailure
    L6_2 = L1_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = L3_2.learning_mode
    if L7_2 then
      L7_2 = checkBruteForceCookie
      L7_2 = L7_2()
      if not L7_2 then
        return
      end
    end
    L7_2 = GetRollingQueueKeyValue
    L8_2 = "CloudCallProcessingQueue"
    L9_2 = L1_2.Ip
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 == "1" then
      L7_2 = addRQValue
      L8_2 = "BF-HighVolumeRequest"
      L9_2 = L1_2.Ip
      L10_2 = 1
      L11_2 = 86400
      L12_2 = 1000
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      return
    end
    L7_2 = nil
    L8_2 = nil
    L9_2 = nil
    L10_2 = nil
    L11_2 = nil
    L12_2 = nil
    L13_2 = mp
    L13_2 = L13_2.bitand
    L14_2 = L5_2
    L15_2 = 1
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 == 1 then
      L13_2 = longCall
      L14_2 = getRDPTelemetryData
      L15_2 = L6_2
      L16_2 = L1_2
      L17_2 = L4_2
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
      L14_2 = longCall
      L15_2 = safeJsonSerialize
      L16_2 = L3_2
      L14_2 = L14_2(L15_2, L16_2)
      L13_2.config = L14_2
      L13_2.ip_address_class = L2_2
      L14_2 = L3_2.block_local_ip
      if L14_2 or L2_2 ~= 1 then
        L14_2 = AppendToRollingQueue
        L15_2 = "CloudCallProcessingQueue"
        L16_2 = L1_2.Ip
        L17_2 = 1
        L18_2 = 300
        L19_2 = 1000
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
        L13_2.CONTEXT_SOURCE = "LBFF"
        if L2_2 ~= 3 then
          L13_2.TAG = "NOLOOKUP"
        end
        L14_2 = SafeGetUrlReputation
        L15_2 = {}
        L16_2 = L1_2.Ip
        L15_2[1] = L16_2
        L16_2 = L13_2
        L17_2 = false
        L18_2 = 4000
        L19_2 = false
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
        L7_2 = L14_2
        L14_2 = L7_2.urls
        L15_2 = L1_2.Ip
        L14_2 = L14_2[L15_2]
        if L14_2 then
          L14_2 = L7_2.urls
          L15_2 = L1_2.Ip
          L14_2 = L14_2[L15_2]
          L8_2 = L14_2.determination
          L14_2 = L7_2.urls
          L15_2 = L1_2.Ip
          L14_2 = L14_2[L15_2]
          L9_2 = L14_2.confidence
          L14_2 = L7_2.urls
          L15_2 = L1_2.Ip
          L14_2 = L14_2[L15_2]
          L14_2 = L14_2.context
          L10_2 = L14_2.source
          L14_2 = L7_2.urls
          L15_2 = L1_2.Ip
          L14_2 = L14_2[L15_2]
          L14_2 = L14_2.context
          L11_2 = L14_2.signature_disable_ttl
          L14_2 = L7_2.urls
          L15_2 = L1_2.Ip
          L14_2 = L14_2[L15_2]
          L14_2 = L14_2.context
          L12_2 = L14_2.clean_bf_resources
          if L11_2 then
            L14_2 = AppendToRollingQueue
            L15_2 = "BruteForceProtection-Cloud-Config"
            L16_2 = "signature_disable"
            L17_2 = L11_2
            L18_2 = tonumber
            L19_2 = L11_2
            L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L18_2(L19_2)
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
          end
          if L12_2 then
            L14_2 = longCall
            L15_2 = cleanBruteForceResource
            L14_2(L15_2)
            return
          end
        else
          L14_2 = L7_2.error
          if L14_2 == 3 then
            L14_2 = addRQValue
            L15_2 = "BF-FailedCloudCalls"
            L16_2 = "Counter"
            L17_2 = 1
            L18_2 = 86400
            L19_2 = 10
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
            L14_2 = AppendToRollingQueue
            L15_2 = "BF-FailedCloudCalls"
            L16_2 = "LastError"
            L17_2 = L7_2.err_msg
            L18_2 = 86400
            L19_2 = 10
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
          end
        end
      end
      if L8_2 == 1 and L10_2 == "BruteforceReputationLookup" then
        L14_2 = AppendToRollingQueue
        L15_2 = "RDP_Ip"
        L16_2 = L1_2.Ip
        L17_2 = 0
        L18_2 = 604800
        L19_2 = 1000
        L20_2 = 1
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L14_2 = AppendToRollingQueue
        L15_2 = "RDP_Usr"
        L16_2 = L1_2.TFUN
        L17_2 = 0
        L18_2 = 604800
        L19_2 = 1000
        L20_2 = 1
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L14_2 = AppendToRollingQueue
        L15_2 = "RDP_blocked_IP"
        L16_2 = L1_2.Ip
        L17_2 = 0
        L18_2 = 604800
        L19_2 = 1000
        L20_2 = 1
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      else
        L14_2 = nil
        L15_2 = {}
        L16_2 = 180
        L17_2 = 900
        L18_2 = 3600
        L19_2 = 21600
        L20_2 = 86400
        L21_2 = 604800
        L15_2[1] = L16_2
        L15_2[2] = L17_2
        L15_2[3] = L18_2
        L15_2[4] = L19_2
        L15_2[5] = L20_2
        L15_2[6] = L21_2
        L16_2 = addRQValue
        L17_2 = "RDP_blocked_IP"
        L18_2 = L1_2.Ip
        L19_2 = 1
        L20_2 = 604800
        L21_2 = 1000
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
        L17_2 = math_min
        L18_2 = 5
        L19_2 = L16_2
        L17_2 = L17_2(L18_2, L19_2)
        L16_2 = L17_2
        if L9_2 == 100 then
          L17_2 = math_max
          L18_2 = L15_2[L16_2]
          L19_2 = L15_2[3]
          L17_2 = L17_2(L18_2, L19_2)
          L14_2 = L17_2
        else
          L14_2 = L15_2[L16_2]
        end
        L17_2 = L3_2.MaxTimeout
        if L17_2 then
          L17_2 = L3_2.MaxTimeout
          if L17_2 ~= 0 then
            L17_2 = math_min
            L18_2 = L3_2.MaxTimeout
            L19_2 = L14_2
            L17_2 = L17_2(L18_2, L19_2)
            L14_2 = L17_2
          end
        end
        if L2_2 == 1 then
          L17_2 = L3_2.block_local_ip
          if not L17_2 then
            L17_2 = false
            L18_2 = GetRollingQueueKeyValue
            L19_2 = "domainInfo"
            L20_2 = L1_2.Ip
            L18_2 = L18_2(L19_2, L20_2)
            if L18_2 then
              L19_2 = mp
              L19_2 = L19_2.bitand
              L20_2 = L18_2
              L21_2 = 48
              L19_2 = L19_2(L20_2, L21_2)
              if L19_2 ~= 0 then
                L17_2 = true
              end
            end
            if not L17_2 then
              return
            else
              L19_2 = MpCommon
              L19_2 = L19_2.IsSampled
              L20_2 = 20000
              L21_2 = true
              L22_2 = true
              L23_2 = true
              L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
              if L19_2 then
                L13_2.CONTEXT_SOURCE = "LBFF"
                L13_2.TAG = "NOLOOKUP"
                L19_2 = SafeGetUrlReputation
                L20_2 = {}
                L21_2 = L1_2.Ip
                L20_2[1] = L21_2
                L21_2 = L13_2
                L22_2 = false
                L23_2 = 2000
                L24_2 = false
                L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                L7_2 = L19_2
                L19_2 = L7_2.urls
                L20_2 = L1_2.Ip
                L19_2 = L19_2[L20_2]
                if L19_2 then
                  L19_2 = L7_2.urls
                  L20_2 = L1_2.Ip
                  L19_2 = L19_2[L20_2]
                  L8_2 = L19_2.determination
                  L19_2 = L7_2.urls
                  L20_2 = L1_2.Ip
                  L19_2 = L19_2[L20_2]
                  L9_2 = L19_2.confidence
                  L19_2 = L7_2.urls
                  L20_2 = L1_2.Ip
                  L19_2 = L19_2[L20_2]
                  L19_2 = L19_2.context
                  L10_2 = L19_2.source
                  L19_2 = L7_2.urls
                  L20_2 = L1_2.Ip
                  L19_2 = L19_2[L20_2]
                  L19_2 = L19_2.context
                  L11_2 = L19_2.signature_disable_ttl
                  L19_2 = L7_2.urls
                  L20_2 = L1_2.Ip
                  L19_2 = L19_2[L20_2]
                  L19_2 = L19_2.context
                  L12_2 = L19_2.clean_bf_resources
                  if L11_2 then
                    L19_2 = AppendToRollingQueue
                    L20_2 = "BruteForceProtection-Cloud-Config"
                    L21_2 = "signature_disable"
                    L22_2 = L11_2
                    L23_2 = tonumber
                    L24_2 = L11_2
                    L23_2, L24_2 = L23_2(L24_2)
                    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                  end
                  if L12_2 then
                    L19_2 = cleanBruteForceResource
                    L19_2()
                    return
                  end
                else
                  L19_2 = L7_2.error
                  if L19_2 == 3 then
                    L19_2 = addRQValue
                    L20_2 = "BF-FailedCloudCalls"
                    L21_2 = "Counter"
                    L22_2 = 1
                    L23_2 = 86400
                    L24_2 = 10
                    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                    L19_2 = AppendToRollingQueue
                    L20_2 = "BF-FailedCloudCalls"
                    L21_2 = "LastError"
                    L22_2 = L7_2.err_msg
                    L23_2 = 86400
                    L24_2 = 10
                    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
                  end
                end
              end
            end
          end
        end
        L17_2 = L3_2.AggressiveLevel
        if L17_2 ~= 0 or L9_2 ~= 100 then
          L17_2 = L3_2.AggressiveLevel
          if L17_2 ~= 1 or not (70 <= L9_2) then
            L17_2 = L3_2.AggressiveLevel
            if L17_2 ~= 2 then
              goto lbl_438
            end
          end
        end
        L17_2 = L3_2.status
        if L17_2 == 1 then
          L17_2 = MpCommon
          L17_2 = L17_2.AddBlockingFirewallRule
          L18_2 = L1_2.Ip
          L19_2 = L14_2
          L20_2 = true
          L17_2(L18_2, L19_2, L20_2)
        end
        L17_2 = {}
        L18_2 = L1_2.Ip
        L17_2.IP = L18_2
        L18_2 = L1_2.Wsn
        L17_2.WorkStationName = L18_2
        L17_2.CONTEXT_SOURCE = "LBFF"
        L18_2 = L1_2.TN
        L17_2.Username = L18_2
        L18_2 = L1_2.TDN
        L17_2.DomainName = L18_2
        L18_2 = bm
        L18_2 = L18_2.trigger_sig
        L19_2 = "BruteForceDetectionAdditionalInfo"
        L20_2 = safeJsonSerialize
        L21_2 = L17_2
        L20_2, L21_2, L22_2, L23_2, L24_2 = L20_2(L21_2)
        L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
        ::lbl_438::
        L17_2 = blockIP
        L18_2 = L1_2.Ip
        L19_2 = L14_2
        L17_2(L18_2, L19_2)
        L17_2 = AppendToRollingQueue
        L18_2 = "CloudCallProcessingQueue"
        L19_2 = L1_2.Ip
        L20_2 = 0
        L21_2 = 1
        L22_2 = 1000
        L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
      end
    elseif L2_2 ~= 1 then
      L13_2 = MpCommon
      L13_2 = L13_2.IsSampled
      L14_2 = 100
      L15_2 = false
      L16_2 = true
      L17_2 = true
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
      if L13_2 then
        L13_2 = GetRollingQueueCount
        L14_2 = "RDP-IP-Failed-Counter"
        L13_2 = L13_2(L14_2)
        if L13_2 == 1000 then
          return
        end
        L13_2 = GetRollingQueueKeyValue
        L14_2 = "RDP-IP-Failed-Counter"
        L15_2 = L1_2.Ip
        L13_2 = L13_2(L14_2, L15_2)
        if L13_2 == "1" then
          L13_2 = GetRollingQueueKeyValue
          L14_2 = "RDP-Ip-Failed-Counter"
          L15_2 = L1_2.Ip
          L13_2 = L13_2(L14_2, L15_2)
          if L13_2 == nil then
            L13_2 = getRDPTelemetryData
            L14_2 = L6_2
            L15_2 = L1_2
            L16_2 = L4_2
            L13_2 = L13_2(L14_2, L15_2, L16_2)
            L13_2.ip_address_class = L2_2
            L13_2.CONTEXT_SOURCE = "LBFF"
            L13_2.reason = "spraying attack"
            L14_2 = SafeGetUrlReputation
            L15_2 = {}
            L16_2 = L1_2.Ip
            L15_2[1] = L16_2
            L16_2 = L13_2
            L17_2 = false
            L18_2 = 2000
            L19_2 = false
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
            L7_2 = L14_2
            L14_2 = L7_2.urls
            L15_2 = L1_2.Ip
            L14_2 = L14_2[L15_2]
            if L14_2 then
              L14_2 = L7_2.urls
              L15_2 = L1_2.Ip
              L14_2 = L14_2[L15_2]
              L8_2 = L14_2.determination
              L14_2 = L7_2.urls
              L15_2 = L1_2.Ip
              L14_2 = L14_2[L15_2]
              L9_2 = L14_2.confidence
              L14_2 = L7_2.urls
              L15_2 = L1_2.Ip
              L14_2 = L14_2[L15_2]
              L14_2 = L14_2.context
              L10_2 = L14_2.source
              L14_2 = L7_2.urls
              L15_2 = L1_2.Ip
              L14_2 = L14_2[L15_2]
              L14_2 = L14_2.context
              L11_2 = L14_2.signature_disable_ttl
              L14_2 = L7_2.urls
              L15_2 = L1_2.Ip
              L14_2 = L14_2[L15_2]
              L14_2 = L14_2.context
              L12_2 = L14_2.clean_bf_resources
              if L11_2 then
                L14_2 = AppendToRollingQueue
                L15_2 = "BruteForceProtection-Cloud-Config"
                L16_2 = "signature_disable"
                L17_2 = L11_2
                L18_2 = tonumber
                L19_2 = L11_2
                L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L18_2(L19_2)
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
              end
              if L12_2 then
                L14_2 = cleanBruteForceResource
                L14_2()
                return
              end
              if L9_2 == 100 then
                L14_2 = addRQValue
                L15_2 = "RDP_Ip"
                L16_2 = L1_2.Ip
                L17_2 = 100
                L18_2 = 604800
                L19_2 = 1000
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
              end
            else
              L14_2 = L7_2.error
              if L14_2 == 3 then
                L14_2 = addRQValue
                L15_2 = "BF-FailedCloudCalls"
                L16_2 = "Counter"
                L17_2 = 1
                L18_2 = 86400
                L19_2 = 10
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
                L14_2 = AppendToRollingQueue
                L15_2 = "BF-FailedCloudCalls"
                L16_2 = "LastError"
                L17_2 = L7_2.err_msg
                L18_2 = 86400
                L19_2 = 10
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
              end
            end
          end
        end
      end
    end
  end
  return
end

checkLogonFailureEvent = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = "GenB_FLAG_SameExtension"
  L4_2 = "GenB_FLAG_Encrypt3Folder"
  L5_2 = "GenB_FLAG_SameRenameFolder"
  L6_2 = "GenB_FLAG_AllFileUnknown"
  L7_2 = "GenB_FLAG_SameMagicByte"
  L8_2 = "GenB_FLAG_AllFileHasHighEntropy"
  L9_2 = "GenB_FLAG_AllFileMagicExtMismatch"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L1_2
    L9_2 = L2_2[L6_2]
    L10_2 = "="
    L11_2 = tostring
    L12_2 = mp
    L12_2 = L12_2.bitand
    L13_2 = A0_2
    L14_2 = math_pow
    L15_2 = 2
    L16_2 = L6_2 - 1
    L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
    L12_2 = 0 < L12_2
    L11_2 = L11_2(L12_2)
    L9_2 = L9_2 .. L10_2 .. L11_2
    L7_2(L8_2, L9_2)
  end
  return L1_2
end

renderFeatures = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2
  L0_2 = 1
  L1_2 = 2
  L2_2 = 4
  L3_2 = 8
  L4_2 = 16
  L5_2 = 32
  L6_2 = 64
  L7_2 = 0
  L8_2 = bm
  L8_2 = L8_2.get_current_process_startup_info
  L8_2 = L8_2()
  L9_2 = L8_2.ppid
  L8_2 = L9_2 or L8_2
  if not L9_2 then
    L8_2 = -1
  end
  L9_2 = "genb_ransom_meta_"
  L10_2 = L8_2
  L9_2 = L9_2 .. L10_2
  L10_2 = MpCommon
  L10_2 = L10_2.RollingQueueCount
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  if L10_2 ~= nil and 25 <= L10_2 and L10_2 <= 100 then
    L11_2 = GetRollingQueue
    L12_2 = L9_2
    L11_2 = L11_2(L12_2)
    if L11_2 ~= nil then
      L12_2 = type
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      if L12_2 == "table" then
        goto lbl_42
      end
    end
    L12_2 = mp
    L12_2 = L12_2.CLEAN
    do return L12_2 end
    ::lbl_42::
    L12_2 = nil
    L13_2 = ""
    L14_2 = ""
    L15_2 = {}
    L16_2 = 0
    L17_2 = {}
    L18_2 = 0
    L19_2 = 0
    L20_2 = {}
    L21_2 = 0
    L22_2 = 0
    L23_2 = 0
    L24_2 = ""
    L25_2 = false
    L26_2 = ""
    L27_2 = ""
    L28_2 = ""
    L29_2 = ""
    L30_2 = ""
    L31_2 = ""
    L32_2 = ipairs
    L33_2 = L11_2
    L32_2, L33_2, L34_2 = L32_2(L33_2)
    for L35_2, L36_2 in L32_2, L33_2, L34_2 do
      L37_2 = explode
      L38_2 = L36_2.value
      L39_2 = "|"
      L37_2 = L37_2(L38_2, L39_2)
      L12_2 = L37_2
      L26_2 = L12_2[1]
      L27_2 = L12_2[2]
      L28_2 = L12_2[3]
      L29_2 = L12_2[4]
      L30_2 = L12_2[6]
      L31_2 = L12_2[7]
      L37_2 = L17_2[L26_2]
      if L37_2 ~= 1 then
        L18_2 = L18_2 + 1
        L17_2[L26_2] = 1
      end
      L37_2 = string
      L37_2 = L37_2.match
      L38_2 = L27_2
      L39_2 = "(.*[/\\])"
      L37_2 = L37_2(L38_2, L39_2)
      L13_2 = L37_2
      L37_2 = mp
      L37_2 = L37_2.crc32
      L38_2 = 0
      L39_2 = L13_2
      L40_2 = 1
      L41_2 = #L13_2
      L37_2 = L37_2(L38_2, L39_2, L40_2, L41_2)
      L14_2 = L37_2
      L37_2 = L15_2[L14_2]
      if L37_2 ~= 1 then
        L16_2 = L16_2 + 1
        L15_2[L14_2] = 1
      end
      L37_2 = string
      L37_2 = L37_2.match
      L38_2 = L28_2
      L39_2 = "(.*[/\\])"
      L37_2 = L37_2(L38_2, L39_2)
      L24_2 = L37_2
      if L24_2 ~= L13_2 and L25_2 == false then
        L25_2 = true
      end
      if L29_2 == "Unknown" then
        L19_2 = L19_2 + 1
      end
      L37_2 = L20_2[L30_2]
      if L37_2 ~= 1 then
        L21_2 = L21_2 + 1
        L20_2[L30_2] = 1
      end
      L37_2 = ExtensionToMagicMismatch
      L38_2 = L26_2
      L39_2 = L30_2
      L37_2 = L37_2(L38_2, L39_2)
      if L37_2 == true then
        L23_2 = L23_2 + 1
      end
      if 7 <= L31_2 then
        L22_2 = L22_2 + 1
      end
    end
    if L18_2 == 1 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L0_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if 3 < L16_2 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L1_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if L25_2 == false then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L2_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if L19_2 == L10_2 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L3_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if L21_2 == 1 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L4_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if L22_2 == L10_2 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L5_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
    if L23_2 == L10_2 then
      L32_2 = mp
      L32_2 = L32_2.bitor
      L33_2 = L7_2
      L34_2 = L6_2
      L32_2 = L32_2(L33_2, L34_2)
      L7_2 = L32_2
    end
  end
  L11_2 = renderFeatures
  L12_2 = L7_2
  return L11_2(L12_2)
end

RansomwareFeatures = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L1_2 = 0
  L2_2 = 0
  L3_2 = 1
  L4_2 = 2
  L5_2 = 4
  L6_2 = 8
  L7_2 = 16
  L8_2 = 32
  L9_2 = 64
  L10_2 = 128
  L11_2 = 256
  L12_2 = 512
  L13_2 = 1024
  L14_2 = 2048
  L15_2 = 4096
  L16_2 = 8192
  L17_2 = 16384
  L18_2 = 32568
  L19_2 = 65536
  L20_2 = isPublicIP
  L21_2 = A0_2.Ip
  L20_2 = L20_2(L21_2)
  
  function L21_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3
    L3_3 = isKnownWorkstationForIP
    L4_3 = A0_3.Ip
    L5_3 = A0_3.Wsn
    L3_3 = L3_3(L4_3, L5_3)
    if L3_3 then
      L3_3 = mp
      L3_3 = L3_3.bitor
      L4_3 = A2_3
      L5_3 = L14_2
      L3_3 = L3_3(L4_3, L5_3)
      A2_3 = L3_3
      A1_3 = A1_3 - 10
    else
      L3_3 = isKnownWorkstationForUser
      L4_3 = A0_3.TFUN
      L5_3 = A0_3.Wsn
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = mp
        L3_3 = L3_3.bitor
        L4_3 = A2_3
        L5_3 = L15_2
        L3_3 = L3_3(L4_3, L5_3)
        A2_3 = L3_3
        A1_3 = A1_3 - 10
      else
        L3_3 = isKnownWorkstation
        L4_3 = A0_3.Wsn
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = mp
          L3_3 = L3_3.bitor
          L4_3 = A2_3
          L5_3 = L13_2
          L3_3 = L3_3(L4_3, L5_3)
          A2_3 = L3_3
          A1_3 = A1_3 - 5
        else
          L3_3 = isKnownAttackerWorkstation
          L4_3 = A0_3
          L3_3, L4_3 = L3_3(L4_3)
          if L3_3 then
            L5_3 = mp
            L5_3 = L5_3.bitor
            L6_3 = A2_3
            L7_3 = L9_2
            L5_3 = L5_3(L6_3, L7_3)
            A2_3 = L5_3
            A1_3 = A1_3 + L4_3
          else
            L5_3 = mp
            L5_3 = L5_3.bitand
            L6_3 = A2_3
            L7_3 = L8_2
            L5_3 = L5_3(L6_3, L7_3)
            L6_3 = L8_2
            if L5_3 == L6_3 then
              L5_3 = mp
              L5_3 = L5_3.bitand
              L6_3 = A2_3
              L7_3 = L7_2
              L5_3 = L5_3(L6_3, L7_3)
              L6_3 = L7_2
              if L5_3 == L6_3 then
                A1_3 = A1_3 + 1
            end
            else
              A1_3 = A1_3 + 10
            end
          end
        end
      end
    end
    L3_3 = A1_3
    L4_3 = A2_3
    return L3_3, L4_3
  end
  
  ComputeWSNScore = L21_2
  
  function L21_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L3_3 = A0_3.SubStatus
    if L3_3 ~= 3221225572 then
      L3_3 = mp
      L3_3 = L3_3.bitor
      L4_3 = A2_3
      L5_3 = L5_2
      L3_3 = L3_3(L4_3, L5_3)
      A2_3 = L3_3
      A1_3 = A1_3 - 1
    else
      L3_3 = mp
      L3_3 = L3_3.bitor
      L4_3 = A2_3
      L5_3 = L8_2
      L3_3 = L3_3(L4_3, L5_3)
      A2_3 = L3_3
      L3_3 = getLocalProfileTypoDistance
      L4_3 = A0_3.TN
      L5_3 = 3
      L3_3, L4_3 = L3_3(L4_3, L5_3)
      if L3_3 < 3 then
        L5_3 = mp
        L5_3 = L5_3.bitor
        L6_3 = A2_3
        L7_3 = L7_2
        L5_3 = L5_3(L6_3, L7_3)
        A2_3 = L5_3
        L5_3 = math_min
        L6_3 = math_floor
        L7_3 = A1_3 * L3_3
        L7_3 = L7_3 / 4
        L6_3 = L6_3(L7_3)
        L7_3 = A1_3 - 10
        L5_3 = L5_3(L6_3, L7_3)
        A1_3 = L5_3
        L5_3 = isKnownUserForIP
        L6_3 = A0_3.Ip
        L7_3 = L4_3
        L5_3 = L5_3(L6_3, L7_3)
        if L5_3 then
          L5_3 = mp
          L5_3 = L5_3.bitor
          L6_3 = A2_3
          L7_3 = L4_2
          L5_3 = L5_3(L6_3, L7_3)
          A2_3 = L5_3
          A1_3 = A1_3 - 10
        end
      else
        A1_3 = A1_3 + 10
        L5_3 = isTopAbusedUser
        L6_3 = A0_3
        L5_3, L6_3 = L5_3(L6_3)
        if L5_3 then
          L7_3 = mp
          L7_3 = L7_3.bitor
          L8_3 = A2_3
          L9_3 = L6_2
          L7_3 = L7_3(L8_3, L9_3)
          A2_3 = L7_3
          A1_3 = A1_3 + L6_3
        end
        L7_3 = A0_3.TDN
        L7_3 = #L7_3
        if L7_3 then
          L7_3 = A0_3.TDN
          if L7_3 ~= "" then
            L7_3 = isValidLocalDomain
            L8_3 = A0_3.TDN
            L7_3 = L7_3(L8_3)
            if 0 < L7_3 then
              L8_3 = mp
              L8_3 = L8_3.bitor
              L9_3 = A2_3
              L10_3 = L18_2
              L8_3 = L8_3(L9_3, L10_3)
              A2_3 = L8_3
              if L7_3 == 1 then
                L8_3 = mp
                L8_3 = L8_3.bitor
                L9_3 = A2_3
                L10_3 = L19_2
                L8_3 = L8_3(L9_3, L10_3)
                A2_3 = L8_3
              end
              A1_3 = A1_3 - 10
            end
          end
        end
      end
    end
    L3_3 = A1_3
    L4_3 = A2_3
    return L3_3, L4_3
  end
  
  ComputeUserScore = L21_2
  
  function L21_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L3_3 = isRemoteLogon
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L3_3 = mp
      L3_3 = L3_3.bitor
      L4_3 = A2_3
      L5_3 = L3_2
      L3_3 = L3_3(L4_3, L5_3)
      A2_3 = L3_3
      L3_3 = L20_2
      if L3_3 then
        L3_3 = mp
        L3_3 = L3_3.bitor
        L4_3 = A2_3
        L5_3 = L16_2
        L3_3 = L3_3(L4_3, L5_3)
        A2_3 = L3_3
        L3_3 = isKnownIP
        L4_3 = A0_3.Ip
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = mp
          L3_3 = L3_3.bitor
          L4_3 = A2_3
          L5_3 = L12_2
          L3_3 = L3_3(L4_3, L5_3)
          A2_3 = L3_3
          A1_3 = A1_3 - 20
          L3_3 = isKnownUserForIP
          L4_3 = A0_3.Ip
          L5_3 = A0_3.TFUN
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L3_3 = mp
            L3_3 = L3_3.bitor
            L4_3 = A2_3
            L5_3 = L4_2
            L3_3 = L3_3(L4_3, L5_3)
            A2_3 = L3_3
            A1_3 = A1_3 - 10
          end
        else
          L3_3 = pcall
          L4_3 = minDistanceToKnownIp
          L5_3 = A0_3
          L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            if L4_3 < 16 then
              L6_3 = mp
              L6_3 = L6_3.bitor
              L7_3 = A2_3
              L8_3 = L10_2
              L6_3 = L6_3(L7_3, L8_3)
              A2_3 = L6_3
              L6_3 = A1_3 + L4_3
              A1_3 = L6_3 - 8
              L6_3 = isKnownUserForIP
              L7_3 = L5_3
              L8_3 = A0_3.TFUN
              L6_3 = L6_3(L7_3, L8_3)
              if L6_3 then
                L6_3 = mp
                L6_3 = L6_3.bitor
                L7_3 = A2_3
                L8_3 = L4_2
                L6_3 = L6_3(L7_3, L8_3)
                A2_3 = L6_3
                A1_3 = A1_3 - 10
              end
              L6_3 = isKnownWorkstationForIP
              L7_3 = A0_3.Wsn
              L8_3 = L5_3
              L6_3 = L6_3(L7_3, L8_3)
              if L6_3 then
                L6_3 = mp
                L6_3 = L6_3.bitor
                L7_3 = A2_3
                L8_3 = L4_2
                L6_3 = L6_3(L7_3, L8_3)
                A2_3 = L6_3
                A1_3 = A1_3 - 10
              end
            else
              A1_3 = A1_3 + 10
            end
          end
        end
      else
        A1_3 = A1_3 + 10
      end
    end
    L3_3 = A1_3
    L4_3 = A2_3
    return L3_3, L4_3
  end
  
  ComputeIPScore = L21_2
  
  function L21_2(A0_3, ...)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = {}
    L3_3 = pcall
    L4_3 = A0_3
    L5_3 = ...
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L3_3 = L2_3[1]
    if L3_3 then
      L3_3 = L2_3[2]
      L4_3 = L2_3[3]
      return L3_3, L4_3
    else
      L3_3 = 0
      L4_3 = 0
      L5_3 = L2_3[2]
      return L3_3, L4_3, L5_3
    end
  end
  
  pcallErrorLog = L21_2
  L21_2 = 0
  L22_2 = nil
  L23_2 = nil
  L24_2 = nil
  L25_2 = pcallErrorLog
  L26_2 = ComputeIPScore
  L27_2 = A0_2
  L28_2 = L21_2
  L29_2 = L2_2
  L25_2, L26_2, L27_2 = L25_2(L26_2, L27_2, L28_2, L29_2)
  L22_2 = L27_2
  L2_2 = L26_2
  L21_2 = L25_2
  L25_2 = pcallErrorLog
  L26_2 = ComputeUserScore
  L27_2 = A0_2
  L28_2 = L21_2
  L29_2 = L2_2
  L25_2, L26_2, L27_2 = L25_2(L26_2, L27_2, L28_2, L29_2)
  L23_2 = L27_2
  L2_2 = L26_2
  L21_2 = L25_2
  if L20_2 then
    L25_2 = A0_2.Wsn
    if L25_2 ~= "-" then
      L25_2 = pcallErrorLog
      L26_2 = ComputeWSNScore
      L27_2 = A0_2
      L28_2 = L21_2
      L29_2 = L2_2
      L25_2, L26_2, L27_2 = L25_2(L26_2, L27_2, L28_2, L29_2)
      L24_2 = L27_2
      L2_2 = L26_2
      L21_2 = L25_2
    end
  end
  L25_2 = isValidLocalDomain
  L26_2 = A0_2.TDN
  L25_2 = L25_2(L26_2)
  if L25_2 ~= 0 then
    L25_2 = getLastSuccessfulLogonTime
    L26_2 = A0_2.TFUN
    L25_2 = L25_2(L26_2)
    L26_2 = nil
    if L25_2 ~= nil then
      L27_2 = MpCommon
      L27_2 = L27_2.GetCurrentTimeT
      L27_2 = L27_2()
      L26_2 = L27_2 - L25_2
    end
    L27_2 = mp
    L27_2 = L27_2.bitand
    L28_2 = L2_2
    L29_2 = L8_2
    L27_2 = L27_2(L28_2, L29_2)
    if L27_2 == 0 then
      L27_2 = versioning
      L27_2 = L27_2.IsServer
      L27_2 = L27_2()
      if L27_2 then
        if L25_2 == nil or 2592000 < L26_2 then
          L21_2 = L21_2 - 5
        end
      elseif L25_2 == nil or 604800 < L26_2 then
        L21_2 = L21_2 - 5
      end
    end
  end
  if L20_2 then
    L25_2 = GetRollingQueueKeyValue
    L26_2 = "RDP-Ip-Successful-Counter"
    L27_2 = A0_2.Ip
    L25_2 = L25_2(L26_2, L27_2)
    if L25_2 then
      L21_2 = 0
  end
  else
    L25_2 = math_max
    L26_2 = L21_2
    L27_2 = 1
    L25_2 = L25_2(L26_2, L27_2)
    L21_2 = L25_2
  end
  L25_2 = addRQValue
  L26_2 = "RDP_Ip"
  L27_2 = A0_2.Ip
  L28_2 = L21_2
  L29_2 = 604800
  L30_2 = 1000
  L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2)
  L26_2 = 0
  L27_2 = mp
  L27_2 = L27_2.bitand
  L28_2 = L2_2
  L29_2 = L5_2
  L27_2 = L27_2(L28_2, L29_2)
  if L27_2 ~= L5_2 then
    L27_2 = addRQValue
    L28_2 = "RDP_Usr"
    L29_2 = A0_2.TFUN
    L30_2 = L21_2
    L31_2 = 604800
    L32_2 = 1000
    L27_2 = L27_2(L28_2, L29_2, L30_2, L31_2, L32_2)
    L26_2 = L27_2
  end
  if 100 <= L25_2 then
    L1_2 = 1
  end
  if 100 <= L26_2 then
    L27_2 = mp
    L27_2 = L27_2.bitor
    L28_2 = L1_2
    L29_2 = 2
    L27_2 = L27_2(L28_2, L29_2)
    L1_2 = L27_2
  end
  L27_2 = {}
  L27_2.IpScore = L25_2
  L27_2.UserScore = L26_2
  L27_2.flags = L2_2
  L27_2.score = L21_2
  L27_2.case = L1_2
  L27_2.compute_ip_sore_error = L22_2
  L27_2.compute_user_score_error = L23_2
  L27_2.compute_wsn_score_error = L24_2
  L28_2 = L1_2
  L29_2 = L27_2
  return L28_2, L29_2
end

analyzeFailure = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = deepCopy
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  A0_2.current_event = L3_2
  L3_2 = getAllIPFailures
  L4_2 = A1_2.Ip
  L3_2 = L3_2(L4_2)
  A0_2.IPF = L3_2
  if A2_2 then
    L3_2 = A1_2.SubStatus
    if L3_2 ~= 3221225572 then
      L3_2 = A0_2.current_event
      L3_2 = L3_2.TN
      if L3_2 then
        L3_2 = A0_2.current_event
        L4_2 = "username_"
        L5_2 = scrubData
        L6_2 = A0_2.current_event
        L6_2 = L6_2.TN
        L5_2 = L5_2(L6_2)
        L4_2 = L4_2 .. L5_2
        L3_2.TN = L4_2
      end
    end
  end
  L3_2 = safeJsonSerialize
  L4_2 = A0_2.current_event
  L3_2 = L3_2(L4_2)
  A0_2.current_event = L3_2
  L3_2 = versioning
  L3_2 = L3_2.IsServer
  L3_2 = L3_2()
  A0_2.IsServer = L3_2
  L3_2 = {}
  L4_2 = pairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = type
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 == "table" then
      L9_2 = safeJsonSerialize
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        goto lbl_60
      end
    end
    L9_2 = type
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 ~= "string" then
      L9_2 = tostring
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        goto lbl_60
      end
    end
    L9_2 = L8_2
    ::lbl_60::
    L3_2[L7_2] = L9_2
  end
  L4_2 = {}
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP-Successful-Counter"
  L7_2 = "counter"
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["RDP-Successful-Counter"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP-Ip-Successful-Counter"
  L7_2 = A1_2.Ip
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["RDP-Ip-Successful-Counter"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP-WSN-Successful-Counter"
  L7_2 = A1_2.Wsn
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["RDP-WSN-Successful-Counter"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP-IP-Failed-Counter"
  L7_2 = A1_2.Ip
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["RDP-Ip-Failed-Counter"] = L5_2
  L5_2 = GetRollingQueueCount
  L6_2 = "RDP-IP-Failed-Counter"
  L5_2 = L5_2(L6_2)
  L4_2["All-Ip-Failed-Count"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDP_blocked_IP"
  L7_2 = A1_2.Ip
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["RDP-blocked-IP-Counter"] = L5_2
  L5_2 = GetRollingQueueCount
  L6_2 = "FW-IPs"
  L5_2 = L5_2(L6_2)
  L4_2.NumberOfBlockedIPs = L5_2
  L5_2 = GetRollingQueueCount
  L6_2 = "FW-IPs-Extended"
  L5_2 = L5_2(L6_2)
  L4_2.NumberOfBlockedIPsExtended = L5_2
  L5_2 = GetRollingQueueCount
  L6_2 = "RDP-Ip-Successful-Counter"
  L5_2 = L5_2(L6_2)
  L4_2["Unique-Ip-Success-Count"] = L5_2
  L5_2 = GetRollingQueueCount
  L6_2 = "localProfiles"
  L5_2 = L5_2(L6_2)
  L4_2.localProfilesCount = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "BF-HighVolumeRequest"
  L7_2 = A1_2.Ip
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["BF-HighVolumeRequest-IP"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "BF-FailedCloudCalls"
  L7_2 = "Counter"
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["BF-FailedCloudCalls-Counter"] = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "BF-FailedCloudCalls"
  L7_2 = "LastError"
  L5_2 = L5_2(L6_2, L7_2)
  L4_2["BF-FailedCloudCalls-LastError"] = L5_2
  L5_2 = safeJsonSerialize
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  if L4_2 then
    L3_2.detection_info = L4_2
  end
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "RDPIncomingConnection"
  L7_2 = A1_2.Ip
  L5_2 = L5_2(L6_2, L7_2)
  L3_2.network_data = L5_2
  L5_2 = L3_2.network_data
  if L5_2 then
    L5_2 = AppendToRollingQueue
    L6_2 = "RDPIncomingConnection"
    L7_2 = A1_2.Ip
    L8_2 = ""
    L9_2 = 1
    L10_2 = 100
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  end
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "DefenderForIdentity"
  L7_2 = "Version"
  L5_2 = L5_2(L6_2, L7_2)
  L3_2.defender_for_identity_version = L5_2
  L5_2 = GetRollingQueueKeyValue
  L6_2 = "DefenderForIdentity"
  L7_2 = "SupportedUsers"
  L5_2 = L5_2(L6_2, L7_2)
  L3_2.defender_for_identity_supported_users = L5_2
  L5_2 = getAadTenantID
  L5_2 = L5_2()
  L3_2.AadTenantID = L5_2
  return L3_2
end

getRDPTelemetryData = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A4_2 then
    A4_2 = 500
  end
  L5_2 = A3_2 or L5_2
  if not A3_2 then
    L5_2 = ""
  end
  L6_2 = pcall
  L7_2 = MpCommon
  L7_2 = L7_2.RollingQueueCreate
  L8_2 = A1_2
  L9_2 = A4_2
  L10_2 = A2_2
  L11_2 = 1
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  if not L6_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = pcall
  L9_2 = MpCommon
  L9_2 = L9_2.RollingQueueAppend
  L10_2 = A1_2
  L11_2 = A0_2
  L12_2 = L5_2
  L13_2 = A2_2
  L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = L9_2
  L6_2 = L8_2
  return L6_2
end

taint = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = pcall
  L4_2 = MpCommon
  L4_2 = L4_2.RollingQueueQueryKey
  L5_2 = A1_2
  L6_2 = A0_2
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 and L4_2 then
    L2_2 = L4_2.value
  end
  L5_2 = L3_2 or L5_2
  L5_2 = L3_2 and L4_2 ~= nil
  L6_2 = L2_2
  return L5_2, L6_2
end

isTainted = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueCount
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    return L2_2
  else
    L3_2 = 0
    return L3_2
  end
end

taintedCount = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.SetPersistContextNoPath
  L5_2 = A1_2
  L6_2 = L3_2
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = true
  return L4_2
end

persistentTaint = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = MpCommon
  L2_2 = L2_2.GetPersistContextNoPath
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = ipairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      if L7_2 == A0_2 then
        L8_2 = true
        return L8_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

isPersistentTainted = L3_1

function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextCount
  L2_2 = A0_2
  return L1_2(L2_2)
end

persistentTaintedCount = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 == nil or A1_2 == nil then
    L4_2 = false
    return L4_2
  end
  L4_2 = A3_2
  if A3_2 == 0 or A3_2 == nil then
    L4_2 = 3
  end
  L5_2 = mp
  L5_2 = L5_2.GetProcessCommandLine
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil then
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L5_2
    L8_2 = A1_2
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = true
      return L6_2
    end
  end
  if A2_2 == true then
    L6_2 = checkParentCmdline
    L7_2 = A0_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = ""
    L11_2 = A1_2
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L8_2[1] = L9_2
    L9_2 = L4_2
    return L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = false
  return L6_2
end

checkFilePathInProcessCommandline = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = A0_2.matched
  if not L1_2 then
    return
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = nil
  L5_2 = nil
  L6_2 = split
  L7_2 = A0_2.utf8p1
  L8_2 = ";"
  L9_2 = L2_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L2_2 = L6_2
  L6_2 = split
  L7_2 = A0_2.utf8p2
  L8_2 = ";"
  L9_2 = L3_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L3_2 = L6_2
  L6_2 = pairs
  L7_2 = L3_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L2_2
    L13_2 = L10_2
    L11_2(L12_2, L13_2)
  end
  L6_2 = ipairs
  L7_2 = L2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    if L10_2 ~= nil then
      L11_2 = string
      L11_2 = L11_2.find
      L12_2 = L10_2
      L13_2 = "(%w+)%s*=%s*(.+)"
      L14_2 = 0
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)
      L5_2 = L14_2
      L4_2 = L13_2
      L9_2 = L12_2
      L9_2 = L11_2
      if L4_2 ~= nil and L5_2 ~= nil then
        L1_2[L4_2] = L5_2
      end
    end
  end
  return L1_2
end

parseNetworkVolumeEvent = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = bm
  L0_2 = L0_2.GetOverallTrafficVolumes
  L0_2 = L0_2()
  L1_2 = {}
  if L0_2 then
    L2_2 = #L0_2
    if 0 < L2_2 then
      L2_2 = safeJsonSerialize
      L3_2 = L0_2
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
      L2_2 = bm
      L2_2 = L2_2.add_related_string
      L3_2 = "BmNetOverallvolumeLen"
      L4_2 = ""
      L5_2 = #L1_2
      L4_2 = L4_2 .. L5_2
      L5_2 = bm
      L5_2 = L5_2.RelatedStringBMReport
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = bm
      L2_2 = L2_2.add_related_string
      L3_2 = "BmNetOverallvolume"
      L4_2 = L1_2
      L5_2 = bm
      L5_2 = L5_2.RelatedStringBMReport
      L2_2(L3_2, L4_2, L5_2)
    end
  end
  return L1_2
end

addOverallNetworkVolume = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = "LuaError"
  L1_2 = GetRollingQueueKeys
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = type
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      L2_2 = ipairs
      L3_2 = L1_2
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2, L6_2 in L2_2, L3_2, L4_2 do
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = L0_2
        L9_2 = L6_2
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
      end
    end
  end
end

reportPcallEx = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetRollingQueueKeys
  L2_2 = "LuaError"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = bm
    L1_2 = L1_2.trigger_sig
    L2_2 = "BMSigLuaErrors"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
end

reportLuaErrors = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = "RdTrace"
  L1_2 = GetRollingQueueKeys
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = type
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" then
      L2_2 = ipairs
      L3_2 = L1_2
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2, L6_2 in L2_2, L3_2, L4_2 do
        L7_2 = bm
        L7_2 = L7_2.add_related_string
        L8_2 = L0_2
        L9_2 = L6_2
        L10_2 = bm
        L10_2 = L10_2.RelatedStringBMReport
        L7_2(L8_2, L9_2, L10_2)
      end
    end
  end
end

reportRdTrace = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = "/etc/shadow"
  L4_2 = "/etc/passwd"
  L5_2 = "/etc/sudoers"
  L6_2 = "/etc/system.d/"
  L7_2 = "/etc/rc"
  L8_2 = "/etc/init.d/"
  L9_2 = "/etc/rc.d/init.d/"
  L10_2 = "/etc/init/"
  L11_2 = "/etc/hosts"
  L12_2 = "/etc/resolv.conf"
  L13_2 = "/etc/profile"
  L14_2 = "/etc/crontab"
  L15_2 = "/etc/bash.bashrc"
  L16_2 = "/etc/profile.d/"
  L17_2 = "/etc/cron"
  L18_2 = "/etc/iptables/"
  L19_2 = "/etc/sysconfig/iptables"
  L20_2 = "/etc/audit/audit.rules"
  L21_2 = "/opt/microsoft/mdatp/conf/mdatp.rules"
  L22_2 = "/opt/microsoft/mdatp/conf/mdatp.conf"
  L23_2 = "/etc/modules"
  L24_2 = "/etc/modprobe.d/"
  L25_2 = "/etc/default/grub"
  L26_2 = "/etc/apt/sources.list"
  L27_2 = "/etc/gshadow"
  L28_2 = "/etc/group"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L2_2[20] = L22_2
  L2_2[21] = L23_2
  L2_2[22] = L24_2
  L2_2[23] = L25_2
  L2_2[24] = L26_2
  L2_2[25] = L27_2
  L2_2[26] = L28_2
  L1_2.prefix = L2_2
  L2_2 = {}
  L3_2 = "/.aws/credentials"
  L4_2 = "/.aws/config"
  L5_2 = "/.docker/config.json"
  L6_2 = "private-keys-v1.d"
  L7_2 = "/secring.gpg"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L1_2.substr = L2_2
  L2_2 = {}
  L3_2 = "^/home/(%w+)/%.ssh/"
  L4_2 = "^/home/(%w+)/%.bash_profile$"
  L5_2 = "^/home/(%w+)/%.bash_login$"
  L6_2 = "^/home/(%w+)/%.bash_history$"
  L7_2 = "^/home/(%w+)/%.profile$"
  L8_2 = "^/home/(%w+)/%.bashrc$"
  L9_2 = "^/home/(%w+)/%.tcshrc$"
  L10_2 = "^/home/(%w+)/%.cshrc$"
  L11_2 = "^/home/(%w+)/%.kshrc$"
  L12_2 = "^/home/(%w+)/%.zshrc$"
  L13_2 = "^/home/(%w+)/%.shrc$"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L1_2.regex = L2_2
  if A0_2 == nil or A0_2 == "" then
    L2_2 = false
    return L2_2
  end
  L2_2 = ipairs
  L3_2 = L1_2.prefix
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 == 1 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = ipairs
  L3_2 = L1_2.substr
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = ipairs
  L3_2 = L1_2.regex
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

isSensitiveFileForLinux = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  if not A0_2 then
    return
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = "^%s*\""
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = A0_2
    L4_2 = "^%s*\"[^\"]*regsvr32[%.ex]*\"%s"
    L5_2 = ""
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A0_2 = L2_2
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = A0_2
    L4_2 = "^%s*\"[^\"]*rundll32[%.ex]*\"%s"
    L5_2 = ""
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A0_2 = L2_2
  else
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = A0_2
    L4_2 = "^%s*[%S]*regsvr32[%.ex]*%s"
    L5_2 = ""
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A0_2 = L2_2
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = A0_2
    L4_2 = "^%s*[%S]*rundll32[%.ex]*%s"
    L5_2 = ""
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    A0_2 = L2_2
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "[/-]%l+%s"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "[/-]i:[%S]+"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = "^%s*\""
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A0_2
    L4_2 = "^%s*\"([^\",]+)\""
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    L1_2 = L4_2
    _ = L3_2
    _ = L2_2
  else
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A0_2
    L4_2 = "^%s*([^%s,]+)"
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    L1_2 = L4_2
    _ = L3_2
    _ = L2_2
  end
  if L1_2 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = L1_2
    L4_2 = "%.+$"
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = string
      L2_2 = L2_2.gsub
      L3_2 = L1_2
      L4_2 = "%.+$"
      L5_2 = ""
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      L1_2 = L2_2
    end
  end
  if L1_2 then
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = L1_2
    L4_2 = "/"
    L5_2 = "\\"
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L1_2 = L2_2
    L2_2 = false
    L3_2 = StringStartsWith
    L4_2 = L1_2
    L5_2 = "\\\\"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L2_2 = true
    end
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "\\+"
    L6_2 = "\\"
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    if L2_2 then
      L3_2 = "\\"
      L4_2 = L1_2
      L1_2 = L3_2 .. L4_2
    end
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "^\\\\%.\\"
    L6_2 = ""
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "\\%.\\"
    L6_2 = "\\"
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "^\\\\%?\\"
    L6_2 = ""
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "^\\\\localhost\\c%$\\"
    L6_2 = "c:\\"
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    L3_2 = string
    L3_2 = L3_2.gsub
    L4_2 = L1_2
    L5_2 = "^\\\\127%.0%.0%.1\\c%$\\"
    L6_2 = "c:\\"
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
  end
  return L1_2
end

extractDllForRegproc = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = mp
    L1_2 = L1_2.CLEAN
    return L1_2
  end
  L1_2 = "dummy_image_path"
  L2_2 = "dummy_proc_info"
  L3_2 = ""
  L4_2 = GetRollingQueueAsHashTable
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil then
    L5_2 = mp
    L5_2 = L5_2.CLEAN
    return L5_2
  end
  L5_2 = L4_2.cur_image_path
  if L5_2 ~= nil then
    L1_2 = L4_2.cur_image_path
  end
  L5_2 = L4_2.proc_info
  if L5_2 ~= nil then
    L2_2 = L4_2.proc_info
  end
  L5_2 = L4_2.appended_ext
  if L5_2 ~= nil then
    L3_2 = L4_2.appended_ext
  end
  if L1_2 == "" or L2_2 == "" then
    L5_2 = mp
    L5_2 = L5_2.CLEAN
    return L5_2
  end
  L5_2 = bm
  L5_2 = L5_2.get_current_process_startup_info
  L5_2 = L5_2()
  if L5_2 ~= nil then
    L5_2 = L5_2.ppid
  else
    L5_2 = "-2"
  end
  L6_2 = bm
  L6_2 = L6_2.add_related_file
  L7_2 = L1_2
  L6_2(L7_2)
  L6_2 = bm
  L6_2 = L6_2.add_related_string
  L7_2 = "debug_proc_info"
  L8_2 = "old <"
  L9_2 = L2_2
  L10_2 = "> new <"
  L11_2 = L5_2
  L12_2 = ">"
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L9_2 = bm
  L9_2 = L9_2.RelatedStringBMReport
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = bm
  L6_2 = L6_2.add_related_string
  L7_2 = "ransom_extension"
  L8_2 = L3_2
  L9_2 = bm
  L9_2 = L9_2.RelatedStringBMReport
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = StringSplit
  L7_2 = L4_2.renamed_file_path
  L8_2 = ","
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 == nil then
    L7_2 = #L6_2
    if L7_2 == 0 then
      goto lbl_87
    end
  end
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = bm
    L11_2 = L11_2.add_related_file
    L12_2 = L6_2[L10_2]
    L11_2(L12_2)
  end
  ::lbl_87::
  L7_2 = mp
  L7_2 = L7_2.INFECTED
  return L7_2
end

reportGenericRansomwareRQ = L3_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = bm
  L0_2 = L0_2.get_current_process_startup_info
  L0_2 = L0_2()
  L1_2 = MpCommon
  L1_2 = L1_2.IsFriendlyProcess
  L2_2 = L0_2.ppid
  return L1_2(L2_2)
end

isCurrentProcessFriendly = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = mp
  L0_2 = L0_2.SIGATTR_LOG_SZ
  if L0_2 == 0 then
    L0_2 = nil
    return L0_2
  end
  L0_2 = ""
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  L2_2 = 1
  L3_2 = -1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = sigattr_tail
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2.attribute
    if L6_2 == 16470 then
      L6_2 = L5_2.utf8p1
      if L6_2 then
        L6_2 = L0_2
        L7_2 = L5_2.utf8p1
        L8_2 = ","
        L0_2 = L6_2 .. L7_2 .. L8_2
      end
    end
  end
  return L0_2
end

getCurProcTaintReason = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 == 0 then
    L3_2 = false
    return L3_2
  end
  L3_2 = A1_2
  if A1_2 == nil or A1_2 < 0 or 5 < A1_2 then
    L3_2 = 5
  end
  L4_2 = A0_2
  if A0_2 == nil or A0_2 == "" then
    L5_2 = bm
    L5_2 = L5_2.get_current_process_startup_info
    L5_2 = L5_2()
    if L5_2 ~= nil then
      L6_2 = L5_2.ppid
      if L6_2 ~= nil then
        L6_2 = L5_2.ppid
        if L6_2 ~= "" then
          goto lbl_31
        end
      end
    end
    L6_2 = false
    do return L6_2 end
    ::lbl_31::
    L4_2 = L5_2.ppid
  end
  L5_2 = "queue_pid_taintfactory_a"
  if A2_2 then
    L6_2 = IsKeyInRollingQueue
    L7_2 = L5_2
    L8_2 = L4_2
    L9_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 then
      L6_2 = true
      return L6_2
    end
  end
  L6_2 = mp
  L6_2 = L6_2.GetParentProcInfo
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if L6_2 ~= nil then
    L7_2 = L6_2.ppid
    if L7_2 ~= nil then
      L7_2 = L6_2.image_path
      if L7_2 ~= nil then
        L7_2 = IsKeyInRollingQueue
        L8_2 = L5_2
        L9_2 = L4_2
        L10_2 = true
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        if L7_2 then
          L7_2 = true
          return L7_2
        end
        L7_2 = CheckIfProcessTreePartOfTaintExecution
        L8_2 = L6_2.ppid
        L9_2 = L3_2 - 1
        return L7_2(L8_2, L9_2)
      end
    end
  end
end

CheckIfProcessTreePartOfTaintExecution = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  if A1_2 == 0 then
    L17_2 = false
    L18_2 = {}
    L19_2 = nil
    return L17_2, L18_2, L19_2
  end
  L17_2 = A1_2
  if A1_2 == nil or A1_2 < 0 or 5 < A1_2 then
    L17_2 = 3
  end
  L18_2 = A4_2 or L18_2
  if not A4_2 then
    L18_2 = false
  end
  L19_2 = A2_2
  if not A2_2 or A2_2 == "" then
    L20_2 = pcall
    L21_2 = bm
    L21_2 = L21_2.get_current_process_startup_info
    L20_2, L21_2 = L20_2(L21_2)
    L16_2 = L21_2
    L14_2 = L20_2
    L20_2 = pcall
    L21_2 = bm
    L21_2 = L21_2.get_imagepath
    L20_2, L21_2 = L20_2(L21_2)
    L7_2 = L21_2
    _ = L20_2
    if L14_2 and L16_2 then
      L20_2 = L16_2.ppid
      if L20_2 then
        L20_2 = L16_2.ppid
        if L20_2 ~= "" and L7_2 then
          goto lbl_51
        end
      end
    end
    L20_2 = false
    L21_2 = {}
    L22_2 = nil
    do return L20_2, L21_2, L22_2 end
    ::lbl_51::
    L19_2 = L16_2.ppid
  end
  L20_2 = pcall
  L21_2 = mp
  L21_2 = L21_2.GetParentProcInfo
  L22_2 = L19_2
  L20_2, L21_2 = L20_2(L21_2, L22_2)
  L15_2 = L21_2
  L14_2 = L20_2
  L20_2 = "queue_pid_tainted_scripts"
  if not A0_2 then
    if L14_2 and L15_2 then
      L21_2 = L15_2.ppid
      if L21_2 then
        L21_2 = L15_2.ppid
        if L21_2 ~= "" then
          L21_2 = L15_2.image_path
          if L21_2 then
            L21_2 = L15_2.image_path
            if L21_2 ~= "" then
              goto lbl_82
            end
          end
        end
      end
    end
    L21_2 = false
    L22_2 = {}
    L23_2 = nil
    do return L21_2, L22_2, L23_2 end
    ::lbl_82::
    L7_2 = L15_2.image_path
    L19_2 = L15_2.ppid
    L15_2 = nil
    L21_2 = pcall
    L22_2 = mp
    L22_2 = L22_2.GetParentProcInfo
    L23_2 = L19_2
    L21_2, L22_2 = L21_2(L22_2, L23_2)
    L15_2 = L22_2
    L14_2 = L21_2
  end
  L21_2 = pcall
  L22_2 = bm
  L22_2 = L22_2.add_related_process
  L23_2 = L19_2
  L21_2(L22_2, L23_2)
  L21_2 = IsKeyInRollingQueue
  L22_2 = L20_2
  L23_2 = L19_2
  L24_2 = true
  L21_2, L22_2 = L21_2(L22_2, L23_2, L24_2)
  L6_2 = L22_2
  L5_2 = L21_2
  if L5_2 then
    L21_2 = pcall
    L22_2 = bm
    L22_2 = L22_2.add_related_file
    L23_2 = L6_2
    L21_2(L22_2, L23_2)
    L13_2 = L6_2
  end
  if L7_2 and L7_2 ~= "" then
    L21_2 = isTainted
    L22_2 = L7_2
    L23_2 = "remote_file_created_taint"
    L21_2 = L21_2(L22_2, L23_2)
    L8_2 = L21_2
    if L8_2 then
      L21_2 = pcall
      L22_2 = bm
      L22_2 = L22_2.add_related_file
      L23_2 = L7_2
      L21_2(L22_2, L23_2)
      L13_2 = L7_2
    end
  end
  L9_2 = L8_2 or L9_2
  if not L8_2 then
    L9_2 = L5_2
  end
  if (L18_2 or not L9_2) and L15_2 then
    L21_2 = L15_2.ppid
    if L21_2 then
      L21_2 = L15_2.ppid
      if L21_2 ~= "" then
        L21_2 = L15_2.image_path
        if L21_2 then
          L21_2 = IsAncestorTaintedScriptOrBin
          L22_2 = true
          L23_2 = L17_2 - 1
          L24_2 = L15_2.ppid
          L25_2 = L15_2.image_path
          L26_2 = L18_2
          L21_2, L22_2, L23_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
          L12_2 = L23_2
          L11_2 = L22_2
          L10_2 = L21_2
          if L9_2 then
            L21_2 = table
            L21_2 = L21_2.insert
            L22_2 = L11_2
            L23_2 = L13_2
            L21_2(L22_2, L23_2)
          end
        end
      end
    end
  end
  L21_2 = L10_2 or L21_2
  if not L10_2 then
    L21_2 = L9_2
  end
  L22_2 = L11_2 or L22_2
  if not L11_2 then
    L22_2 = {}
    L23_2 = L13_2
    L22_2[1] = L23_2
  end
  L23_2 = L12_2 or L23_2
  if not L12_2 then
    L23_2 = L19_2
  end
  return L21_2, L22_2, L23_2
end

IsAncestorTaintedScriptOrBin = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A1_2 == 0 then
    return
  end
  L2_2 = A1_2
  if A1_2 == nil or A1_2 < 0 or 5 < A1_2 then
    L2_2 = 5
  end
  L3_2 = A0_2
  if A0_2 == nil or A0_2 == "" then
    L4_2 = bm
    L4_2 = L4_2.get_current_process_startup_info
    L4_2 = L4_2()
    if L4_2 ~= nil then
      L5_2 = L4_2.ppid
      if L5_2 ~= nil then
        L5_2 = L4_2.ppid
        if L5_2 ~= "" then
          goto lbl_29
        end
      end
    end
    do return end
    ::lbl_29::
    L3_2 = L4_2.ppid
  end
  L4_2 = {}
  L5_2 = {}
  L6_2 = "/var/tmp/"
  L7_2 = "/var/mail/"
  L8_2 = "/var/spool/mail/"
  L9_2 = "/var/lock/"
  L10_2 = "/dev/shm"
  L11_2 = "/home/"
  L12_2 = "/usr/bin/find"
  L13_2 = "/usr/bin/xargs"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L4_2.prefix = L5_2
  L5_2 = {}
  L6_2 = "/python"
  L7_2 = "/perl"
  L8_2 = "/ruby"
  L9_2 = "/bash"
  L10_2 = "/dash"
  L11_2 = "/zsh"
  L12_2 = "/sh"
  L13_2 = "/ksh"
  L14_2 = "/ksh93"
  L15_2 = "/tcsh"
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L5_2[9] = L14_2
  L5_2[10] = L15_2
  L4_2.substr = L5_2
  
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L3_3 = ipairs
    L4_3 = A2_3.prefix
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      L8_3 = string
      L8_3 = L8_3.find
      L9_3 = A1_3
      L10_3 = L7_3
      L11_3 = 1
      L12_3 = true
      L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
      if L8_3 == 1 then
        L8_3 = true
        return L8_3
      end
    end
    L3_3 = ipairs
    L4_3 = A2_3.substr
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      L8_3 = string
      L8_3 = L8_3.find
      L9_3 = A1_3
      L10_3 = L7_3
      L11_3 = 1
      L12_3 = true
      L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
      if L8_3 then
        L8_3 = true
        return L8_3
      end
    end
    L3_3 = isTainted
    L4_3 = A1_3
    L5_3 = "remote_file_created_taint"
    L3_3 = L3_3(L4_3, L5_3)
    if L3_3 then
      L3_3 = true
      return L3_3
    end
    L3_3 = versioning
    L3_3 = L3_3.GetCloudBlockLevel
    L3_3 = L3_3()
    if 4 <= L3_3 then
      L3_3 = string
      L3_3 = L3_3.match
      L4_3 = A0_3
      L5_3 = "pid:(%w+),ProcessStart:(%w+)"
      L3_3, L4_3 = L3_3(L4_3, L5_3)
      if L3_3 ~= nil then
        L5_3 = tonumber
        L6_3 = L3_3
        L5_3 = L5_3(L6_3)
        if 6 < L5_3 then
          L5_3 = string
          L5_3 = L5_3.find
          L6_3 = A1_3
          L7_3 = "/usr/lib/systemd/systemd"
          L8_3 = 1
          L9_3 = true
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
          if L5_3 ~= 1 then
            L5_3 = true
            return L5_3
          end
        end
      end
    end
    L3_3 = false
    return L3_3
  end
  
  shouldKillParent = L5_2
  L5_2 = mp
  L5_2 = L5_2.GetParentProcInfo
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil then
    L6_2 = L5_2.ppid
    if L6_2 ~= nil then
      L6_2 = L5_2.image_path
      if L6_2 ~= nil then
        L6_2 = shouldKillParent
        L7_2 = L5_2.ppid
        L8_2 = L5_2.image_path
        L9_2 = L4_2
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        if L6_2 then
          L6_2 = bm
          L6_2 = L6_2.add_threat_process
          L7_2 = L5_2.ppid
          L6_2(L7_2)
        end
        L6_2 = TerminateParentProcessForLinux
        L7_2 = L5_2.ppid
        L8_2 = L2_2 - 1
        L6_2(L7_2, L8_2)
      end
    end
  end
end

TerminateParentProcessForLinux = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A1_2
  if A1_2 == 0 or A1_2 == nil or A1_2 < 0 or 5 < A1_2 then
    L2_2 = 5
  end
  L3_2 = A0_2
  if A0_2 == nil or A0_2 == "" then
    L4_2 = bm
    L4_2 = L4_2.get_current_process_startup_info
    L4_2 = L4_2()
    if L4_2 ~= nil then
      L5_2 = L4_2.ppid
      if L5_2 ~= nil then
        L5_2 = L4_2.ppid
        if L5_2 ~= "" then
          goto lbl_28
        end
      end
    end
    do return end
    ::lbl_28::
    L3_2 = L4_2.ppid
  end
  L4_2 = TerminateParentProcessForLinux
  L5_2 = L3_2
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  L4_2 = bm
  L4_2 = L4_2.get_process_relationships
  L5_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2)
  L6_2 = ipairs
  L7_2 = L5_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    if L10_2 ~= nil then
      L11_2 = L10_2.ppid
      if L11_2 ~= nil then
        L11_2 = bm
        L11_2 = L11_2.add_threat_process
        L12_2 = L10_2.ppid
        L11_2(L12_2)
      end
    end
  end
end

RemediateProcessTreeForLinux = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  A1_2 = L3_2
  L3_2 = tonumber
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  A2_2 = L3_2
  if A0_2 and A1_2 and A2_2 and 1900 < A0_2 and A0_2 < 2040 and 0 < A1_2 and A1_2 <= 12 and 0 < A2_2 and A2_2 <= 31 then
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end

ValidateDate = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = {}
  L2_2 = "^(%.)(%d+)/(%d+)/(%d+)$"
  L3_2 = "^(%.)(%d+)-(%d+)-(%d+)$"
  L4_2 = "^(%.)(%d+):(%d+):(%d+)$"
  L5_2 = "^(%.)(%d%d%d%d)(%d%d)(%d%d)$"
  L6_2 = "^(%-)(%d%d%d%d)(%d%d)(%d%d)$"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.match
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
    if L7_2 and L8_2 and L9_2 and L10_2 then
      L11_2 = ValidateDate
      L12_2 = L8_2
      L13_2 = L9_2
      L14_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      if L11_2 then
        L11_2 = true
        return L11_2
      end
    end
  end
  L2_2 = false
  return L2_2
end

IsExtensionDatePattern = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L8_2 = 0
  L9_2 = pcall
  L10_2 = MpCommon
  L10_2 = L10_2.RollingQueueCreate
  L11_2 = A0_2
  L12_2 = A1_2
  L13_2 = A2_2
  L14_2 = 1
  L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = L10_2
  L6_2 = L9_2
  if not L6_2 then
    L9_2 = false
    return L9_2
  end
  L9_2 = pcall
  L10_2 = MpCommon
  L10_2 = L10_2.RollingQueueAppend
  L11_2 = A0_2
  L12_2 = A3_2
  L13_2 = A4_2
  L14_2 = A2_2
  L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = L10_2
  L6_2 = L9_2
  if not L6_2 then
    L9_2 = false
    return L9_2
  end
  L9_2 = pcall
  L10_2 = MpCommon
  L10_2 = L10_2.RollingQueueCount
  L11_2 = A0_2
  L9_2, L10_2 = L9_2(L10_2, L11_2)
  L7_2 = L10_2
  L6_2 = L9_2
  if not L6_2 then
    L9_2 = false
    return L9_2
  end
  L8_2 = L7_2
  if A5_2 <= L8_2 then
    L9_2 = true
    return L9_2
  end
  L9_2 = false
  return L9_2
end

ValidateUniqueRQThreshold = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil or A1_2 == nil then
    L3_2 = nil
    return L3_2
  end
  L3_2 = nil
  if A2_2 == nil then
    L3_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\DataStore\\Machine"
  else
    L4_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\DataStore\\"
    L5_2 = A2_2
    L3_2 = L4_2 .. L5_2
  end
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil then
    L5_2 = nil
    return L5_2
  end
  L5_2 = nil
  L6_2 = nil
  L7_2 = ipairs
  L8_2 = sysio
  L8_2 = L8_2.RegEnumKeys
  L9_2 = L4_2
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L8_2(L9_2)
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = L3_2
    L13_2 = "\\"
    L14_2 = L11_2
    L5_2 = L12_2 .. L13_2 .. L14_2
    L12_2 = sysio
    L12_2 = L12_2.RegOpenKey
    L13_2 = L5_2
    L12_2 = L12_2(L13_2)
    L6_2 = L12_2
    if L6_2 then
      L12_2 = sysio
      L12_2 = L12_2.GetRegValueAsString
      L13_2 = L6_2
      L14_2 = "DomainName"
      L12_2 = L12_2(L13_2, L14_2)
      if A0_2 == L12_2 then
        break
      end
    end
    L6_2 = nil
  end
  if L6_2 == nil then
    L7_2 = nil
    return L7_2
  end
  L7_2 = nil
  L8_2 = nil
  L9_2 = ipairs
  L10_2 = sysio
  L10_2 = L10_2.RegEnumKeys
  L11_2 = L6_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2)
  L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
    L14_2 = sysio
    L14_2 = L14_2.RegOpenKey
    L15_2 = L5_2
    L16_2 = "\\"
    L17_2 = L13_2
    L15_2 = L15_2 .. L16_2 .. L17_2
    L14_2 = L14_2(L15_2)
    L8_2 = L14_2
    L14_2 = sysio
    L14_2 = L14_2.GetRegValueAsString
    L15_2 = L8_2
    L16_2 = "GPOName"
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = L14_2
    L14_2 = L14_2.lower
    L14_2 = L14_2(L15_2)
    if A1_2 == L14_2 then
      L14_2 = sysio
      L14_2 = L14_2.GetRegValueAsString
      L15_2 = L8_2
      L16_2 = "FileSysPath"
      L14_2 = L14_2(L15_2, L16_2)
      L7_2 = L14_2
      break
    end
  end
  return L7_2
end

getGpoDataStorePath = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    L1_2 = nil
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.match
  L3_2 = "\\\\(.+)\\sysvol\\(.+)\\policies\\({[0-9a-f\\-]+})\\.+"
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  if L1_2 ~= L2_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L1_2
  L5_2 = L3_2
  return L4_2, L5_2
end

parseGpoSysvolPath = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    L1_2 = nil
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.match
  L3_2 = ".:\\.+\\system32\\grouppolicy\\datastore\\(%x+)\\sysvol\\(.+)\\Policies\\({[0-9a-f\\-]+})\\.+"
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  L4_2 = L1_2
  L5_2 = L2_2
  L6_2 = L3_2
  return L4_2, L5_2, L6_2
end

parseGpoDatastorePath = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A0_2 == nil then
    L2_2 = nil
    return L2_2
  end
  if A1_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = mp
  L2_2 = L2_2.bsplit
  L3_2 = mp
  L3_2 = L3_2.bitand
  L4_2 = A1_2
  L5_2 = 4294967295
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 8
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2)
  L6_2 = mp
  L6_2 = L6_2.bsplit
  L7_2 = mp
  L7_2 = L7_2.bitand
  L8_2 = mp
  L8_2 = L8_2.shr64
  L9_2 = A1_2
  L10_2 = 32
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 4294967295
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = 8
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2)
  L10_2 = mp
  L10_2 = L10_2.bsplit
  L11_2 = mp
  L11_2 = L11_2.bitand
  L12_2 = A0_2
  L13_2 = 4294967295
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = 8
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2)
  L14_2 = mp
  L14_2 = L14_2.bsplit
  L15_2 = mp
  L15_2 = L15_2.bitand
  L16_2 = mp
  L16_2 = L16_2.shr64
  L17_2 = A0_2
  L18_2 = 32
  L16_2 = L16_2(L17_2, L18_2)
  L17_2 = 4294967295
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = 8
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2, L16_2)
  if A0_2 == 0 then
    L18_2 = string
    L18_2 = L18_2.format
    L19_2 = "%d.%d.%d.%d"
    L20_2 = L6_2
    L21_2 = L7_2
    L22_2 = L8_2
    L23_2 = L9_2
    return L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
  else
    L18_2 = ""
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L10_2
    L23_2 = L11_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L12_2
    L23_2 = L13_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L14_2
    L23_2 = L15_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L16_2
    L23_2 = L17_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L2_2
    L23_2 = L3_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L4_2
    L23_2 = L5_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x:"
    L22_2 = L6_2
    L23_2 = L7_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    L19_2 = L18_2
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = "%02x%02x"
    L22_2 = L8_2
    L23_2 = L9_2
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L18_2 = L19_2 .. L20_2
    return L18_2
  end
end

addressToIpString = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if A0_2 == nil then
    L2_2 = nil
    return L2_2
  end
  if A1_2 == nil then
    L2_2 = nil
    return L2_2
  end
  L2_2 = mp
  L2_2 = L2_2.bsplit
  L3_2 = mp
  L3_2 = L3_2.bitand
  L4_2 = A1_2
  L5_2 = 4294967295
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 8
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2)
  L6_2 = mp
  L6_2 = L6_2.bsplit
  L7_2 = mp
  L7_2 = L7_2.bitand
  L8_2 = mp
  L8_2 = L8_2.shr64
  L9_2 = A1_2
  L10_2 = 32
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 4294967295
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = 8
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2)
  L10_2 = mp
  L10_2 = L10_2.bsplit
  L11_2 = mp
  L11_2 = L11_2.bitand
  L12_2 = A0_2
  L13_2 = 4294967295
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = 8
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2)
  L14_2 = mp
  L14_2 = L14_2.bsplit
  L15_2 = mp
  L15_2 = L15_2.bitand
  L16_2 = mp
  L16_2 = L16_2.shr64
  L17_2 = A0_2
  L18_2 = 32
  L16_2 = L16_2(L17_2, L18_2)
  L17_2 = 4294967295
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = 8
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2, L16_2)
  if A0_2 == 0 then
    L18_2 = L6_2 == 10 or L6_2 == 127 or L6_2 == 172 and (15 < L7_2 or L7_2 < 32) or L6_2 == 169 and L7_2 == 254 or L6_2 == 192 and L7_2 == 168
    return L18_2
  else
    L18_2 = L10_2 == 254 and L11_2 == 128 or L10_2 == 252 and L11_2 == 0 or L10_2 == 255
    return L18_2
  end
end

isAddressInternal = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 == nil then
    L1_2 = -1
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^%d+%.%d+%.%d+%.%d+$"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = 1
    return L1_2
  else
    L1_2 = string
    L1_2 = L1_2.match
    L2_2 = A0_2
    L3_2 = "^[:%x]+$"
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = 2
      return L1_2
    else
      L1_2 = string
      L1_2 = L1_2.match
      L2_2 = A0_2
      L3_2 = "^[.%d%a]+$"
      L1_2 = L1_2(L2_2, L3_2)
      if L1_2 then
        L1_2 = 3
        return L1_2
      else
        L1_2 = -1
        return L1_2
      end
    end
  end
end

getHostType = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "string" then
    L1_2 = false
    return L1_2
  end
  L1_2 = false
  L3_2 = A0_2
  L2_2 = A0_2.lower
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = {}
  L3_2 = "[\\s;\\|\\=\\(>\\x22\\x27\\)]iex[\\s\\(\\x22\\x27]"
  L4_2 = "[|]iex[\\x22\\x27\\s]*$"
  L5_2 = "[|][^a-z]{0,4}i[^a-z]{0,4}e[^a-z]{0,4}x[^a-z]{0,4}$"
  L6_2 = "invoke-expression.*"
  L7_2 = "[.\\x22\\x27>]invoke[\\x22\\x27<(]"
  L8_2 = "^iex\\s+"
  L9_2 = "[char][int][decimal]::round(73.2)+[char][int][decimal]::round(68.9)+[char][int][decimal]::round(88)"
  L10_2 = "\\$shellid\\[\\d+\\]\\+\\$shellid\\[\\d+\\]\\+'x'"
  L11_2 = "[\\x22\\x27]i[\\x22\\x27]*\\+[\\x22\\x27]*e[\\x22\\x27]*\\+[\\x22\\x27]*x"
  L12_2 = "\\s*(iex|invoke-expression)"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = MpCommon
    L8_2 = L8_2.StringRegExpSearch
    L9_2 = L7_2
    L10_2 = A0_2
    L8_2, L9_2 = L8_2(L9_2, L10_2)
    L6_2 = L9_2
    L1_2 = L8_2
    if L1_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

isIEXfound = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "string" then
    L1_2 = false
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = "%s%-w(i(n(d(o(w(s(t(y(l(e?)?)?)?)?)?)?)?)?)?)?%s+['\"]?h(i(d(d(e(n?)?)?)?)?)?['\"]?"
  L4_2 = "%s%-w(i(n(d(o(w(s(t(y(l(e?)?)?)?)?)?)?)?)?)?)?%s+['\"]?1['\"]?[%s$]"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L9_2 = L1_2
    L8_2 = L1_2.match
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

isWindowHidden = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L0_2["mssense.exe"] = true
  L0_2["senseir.exe"] = true
  L0_2["sensecm.exe"] = true
  L0_2["sensendr.exe"] = true
  L0_2["sensece.exe"] = true
  L0_2["mdecontaintoolv2.exe"] = true
  L0_2["openhandlecollector.exe"] = true
  L0_2["sensetvm.exe"] = true
  L0_2["senseap.exe"] = true
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = bm
  L2_2 = L2_2.get_imagepath
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  if L1_2 ~= nil then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = L1_2
    L4_2 = "\\program files\\windows defender advanced threat protection\\"
    L5_2 = 1
    L6_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    if not L2_2 then
      L2_2 = string
      L2_2 = L2_2.find
      L3_2 = L1_2
      L4_2 = "\\programdata\\microsoft\\windows defender advanced threat protection\\"
      L5_2 = 1
      L6_2 = true
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      if not L2_2 then
        goto lbl_47
      end
    end
    L2_2 = string
    L2_2 = L2_2.match
    L3_2 = L1_2
    L4_2 = "\\([^\\]+)$"
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L0_2[L2_2]
    if L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  ::lbl_47::
  L2_2 = bm
  L2_2 = L2_2.get_current_process_startup_info
  L2_2 = L2_2()
  L3_2 = mp
  L3_2 = L3_2.GetParentProcInfo
  L4_2 = L2_2.ppid
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    L4_2 = string
    L4_2 = L4_2.lower
    L5_2 = L3_2.image_path
    L4_2 = L4_2(L5_2)
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = L4_2
    L7_2 = "\\program files\\windows defender advanced threat protection\\"
    L8_2 = 1
    L9_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = string
      L5_2 = L5_2.find
      L6_2 = L4_2
      L7_2 = "\\programdata\\microsoft\\windows defender advanced threat protection\\"
      L8_2 = 1
      L9_2 = true
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if not L5_2 then
        goto lbl_88
      end
    end
    L5_2 = string
    L5_2 = L5_2.match
    L6_2 = L4_2
    L7_2 = "\\([^\\]+)$"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = L0_2[L5_2]
    if L6_2 then
      L6_2 = true
      return L6_2
    end
  end
  ::lbl_88::
  L4_2 = false
  return L4_2
end

IsSenseRelatedProc = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = MpCommon
  L0_2 = L0_2.PathToWin32Path
  L1_2 = bm
  L1_2 = L1_2.get_imagepath
  L1_2, L2_2, L3_2, L4_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = L0_2
  L3_2 = "^c:\\program files\\"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = L0_2
    L3_2 = "^c:\\program files %(x86%)\\"
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = L0_2
      L3_2 = "^c:\\programdata\\"
      L1_2 = L1_2(L2_2, L3_2)
      if not L1_2 then
        L1_2 = false
        return L1_2
      end
    end
  end
  L1_2 = {}
  L1_2["2345soft"] = true
  L1_2["360"] = true
  L1_2["360safe"] = true
  L1_2.acronis = true
  L1_2["advanced monitoring agent"] = true
  L1_2.ahnlab = true
  L1_2.alibabaprotect = true
  L1_2["avast software"] = true
  L1_2.avg = true
  L1_2.avira = true
  L1_2.bitdefender = true
  L1_2.cato = true
  L1_2["cato networks"] = true
  L1_2.checkpoint = true
  L1_2.cisco = true
  L1_2.citrix = true
  L1_2.clamav = true
  L1_2.clamwin = true
  L1_2.comodo = true
  L1_2.confer = true
  L1_2.crowdstrike = true
  L1_2.cybercns = true
  L1_2["cybereason activeprobe"] = true
  L1_2.cylance = true
  L1_2.elastic = true
  L1_2.eset = true
  L1_2["f-secure"] = true
  L1_2.fortinet = true
  L1_2.halcyon = true
  L1_2.huorong = true
  L1_2.intermedia = true
  L1_2["kaspersky lab"] = true
  L1_2["keeper security"] = true
  L1_2.lavasoft = true
  L1_2.malwarebytes = true
  L1_2.mcafee = true
  L1_2["n-able"] = true
  L1_2["n-able technologies"] = true
  L1_2.norton = true
  L1_2["norton security"] = true
  L1_2["panda security"] = true
  L1_2.pcpitstop = true
  L1_2.picus = true
  L1_2.qax = true
  L1_2.rapid7 = true
  L1_2.reason = true
  L1_2.reasonlabs = true
  L1_2.rocketagent = true
  L1_2.seewo = true
  L1_2.sentinel = true
  L1_2.sentinelone = true
  L1_2["snow software"] = true
  L1_2.sophos = true
  L1_2.symantec = true
  L1_2["symantec.cloud"] = true
  L1_2["symantec endpoint protection cloud"] = true
  L1_2.tanium = true
  L1_2.tenable = true
  L1_2.threatsonar = true
  L1_2.titanagent = true
  L1_2["trend micro"] = true
  L1_2.typequick = true
  L1_2.vipre = true
  L1_2["vipre business agent"] = true
  L1_2.webroot = true
  L1_2.wrdata = true
  L3_2 = L0_2
  L2_2 = L0_2.match
  L4_2 = "^c:\\.-\\([^\\]+)\\"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = L1_2[L2_2]
    if L3_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = false
  return L3_2
end

IsInThirdPartySecurityPath = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2
  if A0_2 ~= nil then
    L2_2 = #A0_2
    if not (L2_2 < 0) and A1_2 ~= nil then
      L2_2 = #A1_2
      if not (L2_2 < 0) then
        goto lbl_13
      end
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_13::
  L2_2 = {}
  L3_2 = {}
  L4_2 = ".svn-base"
  L5_2 = "/.svn/pristine/"
  L6_2 = 1
  L7_2 = 0
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L4_2 = {}
  L5_2 = ".php"
  L6_2 = "/twig_cache/"
  L7_2 = 1
  L8_2 = 0
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L5_2 = {}
  L6_2 = ".php"
  L7_2 = "/twig/"
  L8_2 = 1
  L9_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L6_2 = {}
  L7_2 = ".php"
  L8_2 = "/wp-content/cache.bak/"
  L9_2 = 1
  L10_2 = 0
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L7_2 = {}
  L8_2 = ".php"
  L9_2 = "/wp-content/cache/"
  L10_2 = 1
  L11_2 = 0
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L8_2 = {}
  L9_2 = ".php"
  L10_2 = "/smarty/templates_c"
  L11_2 = -1
  L12_2 = 1
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L9_2 = {}
  L10_2 = ".php"
  L11_2 = "/tmp/templates_c"
  L12_2 = -1
  L13_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L10_2 = {}
  L11_2 = ".php"
  L12_2 = "/core/cache/catalog.config/"
  L13_2 = 1
  L14_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L11_2 = {}
  L12_2 = ".php"
  L13_2 = "cache/phpstan/"
  L14_2 = -1
  L15_2 = 6
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L11_2[4] = L15_2
  L12_2 = {}
  L13_2 = ".php"
  L14_2 = "/storage/framework/views"
  L15_2 = 1
  L16_2 = 0
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L13_2 = {}
  L14_2 = ".php"
  L15_2 = "/cache/t_compile"
  L16_2 = 1
  L17_2 = 0
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L13_2[4] = L17_2
  L14_2 = {}
  L15_2 = ".php"
  L16_2 = "/aec/app/cache"
  L17_2 = 1
  L18_2 = 0
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L15_2 = {}
  L16_2 = ".php"
  L17_2 = "/compiled_templates"
  L18_2 = 1
  L19_2 = 0
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L15_2[3] = L18_2
  L15_2[4] = L19_2
  L16_2 = {}
  L17_2 = ".php"
  L18_2 = "/administrator/cache/"
  L19_2 = 1
  L20_2 = 0
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L16_2[4] = L20_2
  L17_2 = {}
  L18_2 = ".php"
  L19_2 = "/public_html/templates_c"
  L20_2 = 1
  L21_2 = 0
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L17_2[3] = L20_2
  L17_2[4] = L21_2
  L18_2 = {}
  L19_2 = ".file"
  L20_2 = "/share/flatpak/repo/"
  L21_2 = 1
  L22_2 = 0
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L18_2[4] = L22_2
  L19_2 = {}
  L20_2 = ".file"
  L21_2 = "/flatpak/repo/tmp/flatpak-cache-"
  L22_2 = 1
  L23_2 = 0
  L19_2[1] = L20_2
  L19_2[2] = L21_2
  L19_2[3] = L22_2
  L19_2[4] = L23_2
  L20_2 = {}
  L21_2 = ".py"
  L22_2 = "/python_stubs/"
  L23_2 = 1
  L24_2 = 0
  L20_2[1] = L21_2
  L20_2[2] = L22_2
  L20_2[3] = L23_2
  L20_2[4] = L24_2
  L21_2 = {}
  L22_2 = ".cch"
  L23_2 = "/blockcache"
  L24_2 = -1
  L25_2 = 2
  L21_2[1] = L22_2
  L21_2[2] = L23_2
  L21_2[3] = L24_2
  L21_2[4] = L25_2
  L22_2 = {}
  L23_2 = ".vehicle"
  L24_2 = "/core/packages/"
  L25_2 = 1
  L26_2 = 0
  L22_2[1] = L23_2
  L22_2[2] = L24_2
  L22_2[3] = L25_2
  L22_2[4] = L26_2
  L23_2 = {}
  L24_2 = ".resolver"
  L25_2 = "/core/packages/"
  L26_2 = 1
  L27_2 = 0
  L23_2[1] = L24_2
  L23_2[2] = L25_2
  L23_2[3] = L26_2
  L23_2[4] = L27_2
  L24_2 = {}
  L25_2 = ""
  L26_2 = "/diff/usr/lib/.build-id/"
  L27_2 = -1
  L28_2 = 6
  L24_2[1] = L25_2
  L24_2[2] = L26_2
  L24_2[3] = L27_2
  L24_2[4] = L28_2
  L25_2 = {}
  L26_2 = ""
  L27_2 = "/.metadata/.plugins/org.eclipse.core.resources/.history"
  L28_2 = -1
  L29_2 = 6
  L25_2[1] = L26_2
  L25_2[2] = L27_2
  L25_2[3] = L28_2
  L25_2[4] = L29_2
  L26_2 = {}
  L27_2 = ""
  L28_2 = "/library/developer/xcode/deriveddata/"
  L29_2 = 1
  L30_2 = 0
  L26_2[1] = L27_2
  L26_2[2] = L28_2
  L26_2[3] = L29_2
  L26_2[4] = L30_2
  L27_2 = {}
  L28_2 = ""
  L29_2 = "node_modules/esbuild/bin/esbuild"
  L30_2 = 1
  L31_2 = 0
  L27_2[1] = L28_2
  L27_2[2] = L29_2
  L27_2[3] = L30_2
  L27_2[4] = L31_2
  L28_2 = {}
  L29_2 = ""
  L30_2 = "esbuild/darwin-arm64/bin/esbuild"
  L31_2 = 1
  L32_2 = 0
  L28_2[1] = L29_2
  L28_2[2] = L30_2
  L28_2[3] = L31_2
  L28_2[4] = L32_2
  L29_2 = {}
  L30_2 = ""
  L31_2 = "/smarty"
  L32_2 = -1
  L33_2 = 0
  L29_2[1] = L30_2
  L29_2[2] = L31_2
  L29_2[3] = L32_2
  L29_2[4] = L33_2
  L30_2 = {}
  L31_2 = ""
  L32_2 = "/smarty/"
  L33_2 = 1
  L34_2 = 0
  L30_2[1] = L31_2
  L30_2[2] = L32_2
  L30_2[3] = L33_2
  L30_2[4] = L34_2
  L31_2 = {}
  L32_2 = ""
  L33_2 = "/smarty_site_cache/"
  L34_2 = 1
  L35_2 = 0
  L31_2[1] = L32_2
  L31_2[2] = L33_2
  L31_2[3] = L34_2
  L31_2[4] = L35_2
  L32_2 = {}
  L33_2 = ""
  L34_2 = "/.codeium/windsurf/code_tracker/active/"
  L35_2 = 1
  L36_2 = 0
  L32_2[1] = L33_2
  L32_2[2] = L34_2
  L32_2[3] = L35_2
  L32_2[4] = L36_2
  L33_2 = {}
  L34_2 = ""
  L35_2 = "/.codeium/code_tracker/active/"
  L36_2 = 1
  L37_2 = 0
  L33_2[1] = L34_2
  L33_2[2] = L35_2
  L33_2[3] = L36_2
  L33_2[4] = L37_2
  L34_2 = {}
  L35_2 = ""
  L36_2 = "/node_modules/.bin/store/"
  L37_2 = 1
  L38_2 = 0
  L34_2[1] = L35_2
  L34_2[2] = L36_2
  L34_2[3] = L37_2
  L34_2[4] = L38_2
  L35_2 = {}
  L36_2 = ""
  L37_2 = "/kaspersky/klnagent/"
  L38_2 = 1
  L39_2 = 0
  L35_2[1] = L36_2
  L35_2[2] = L37_2
  L35_2[3] = L38_2
  L35_2[4] = L39_2
  L36_2 = {}
  L37_2 = ""
  L38_2 = "/kaspersky lab/klnagent/"
  L39_2 = 1
  L40_2 = 0
  L36_2[1] = L37_2
  L36_2[2] = L38_2
  L36_2[3] = L39_2
  L36_2[4] = L40_2
  L37_2 = {}
  L38_2 = ""
  L39_2 = "/.cache/mozilla/"
  L40_2 = 1
  L41_2 = 0
  L37_2[1] = L38_2
  L37_2[2] = L39_2
  L37_2[3] = L40_2
  L37_2[4] = L41_2
  L38_2 = {}
  L39_2 = ""
  L40_2 = "/bmc/bladelogic/"
  L41_2 = 1
  L42_2 = 0
  L38_2[1] = L39_2
  L38_2[2] = L40_2
  L38_2[3] = L41_2
  L38_2[4] = L42_2
  L39_2 = {}
  L40_2 = ""
  L41_2 = "/bitrix/managed_cache/"
  L42_2 = 1
  L43_2 = 0
  L39_2[1] = L40_2
  L39_2[2] = L41_2
  L39_2[3] = L42_2
  L39_2[4] = L43_2
  L40_2 = {}
  L41_2 = ""
  L42_2 = "dropbox/.dropbox.cache/old_files"
  L43_2 = 1
  L44_2 = 0
  L40_2[1] = L41_2
  L40_2[2] = L42_2
  L40_2[3] = L43_2
  L40_2[4] = L44_2
  L41_2 = {}
  L42_2 = ""
  L43_2 = "/.git/lfs/"
  L44_2 = 1
  L45_2 = 0
  L41_2[1] = L42_2
  L41_2[2] = L43_2
  L41_2[3] = L44_2
  L41_2[4] = L45_2
  L42_2 = {}
  L43_2 = ""
  L44_2 = "/lfs/objects/"
  L45_2 = 1
  L46_2 = 0
  L42_2[1] = L43_2
  L42_2[2] = L44_2
  L42_2[3] = L45_2
  L42_2[4] = L46_2
  L43_2 = {}
  L44_2 = ""
  L45_2 = "/.git/modules/"
  L46_2 = 1
  L47_2 = 0
  L43_2[1] = L44_2
  L43_2[2] = L45_2
  L43_2[3] = L46_2
  L43_2[4] = L47_2
  L44_2 = {}
  L45_2 = ""
  L46_2 = "/.cache/"
  L47_2 = 1
  L48_2 = 0
  L44_2[1] = L45_2
  L44_2[2] = L46_2
  L44_2[3] = L47_2
  L44_2[4] = L48_2
  L45_2 = {}
  L46_2 = ""
  L47_2 = "/cache/"
  L48_2 = 1
  L49_2 = 0
  L45_2[1] = L46_2
  L45_2[2] = L47_2
  L45_2[3] = L48_2
  L45_2[4] = L49_2
  L46_2 = {}
  L47_2 = ""
  L48_2 = "/hashes/objects"
  L49_2 = 1
  L50_2 = 0
  L46_2[1] = L47_2
  L46_2[2] = L48_2
  L46_2[3] = L49_2
  L46_2[4] = L50_2
  L47_2 = {}
  L48_2 = ""
  L49_2 = "/flatpak/repo/"
  L50_2 = 1
  L51_2 = 0
  L47_2[1] = L48_2
  L47_2[2] = L49_2
  L47_2[3] = L50_2
  L47_2[4] = L51_2
  L48_2 = {}
  L49_2 = ""
  L50_2 = "qualet"
  L51_2 = 1
  L52_2 = 0
  L48_2[1] = L49_2
  L48_2[2] = L50_2
  L48_2[3] = L51_2
  L48_2[4] = L52_2
  L49_2 = {}
  L50_2 = ""
  L51_2 = "azure"
  L52_2 = 1
  L53_2 = 0
  L49_2[1] = L50_2
  L49_2[2] = L51_2
  L49_2[3] = L52_2
  L49_2[4] = L53_2
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L2_2[20] = L22_2
  L2_2[21] = L23_2
  L2_2[22] = L24_2
  L2_2[23] = L25_2
  L2_2[24] = L26_2
  L2_2[25] = L27_2
  L2_2[26] = L28_2
  L2_2[27] = L29_2
  L2_2[28] = L30_2
  L2_2[29] = L31_2
  L2_2[30] = L32_2
  L2_2[31] = L33_2
  L2_2[32] = L34_2
  L2_2[33] = L35_2
  L2_2[34] = L36_2
  L2_2[35] = L37_2
  L2_2[36] = L38_2
  L2_2[37] = L39_2
  L2_2[38] = L40_2
  L2_2[39] = L41_2
  L2_2[40] = L42_2
  L2_2[41] = L43_2
  L2_2[42] = L44_2
  L2_2[43] = L45_2
  L2_2[44] = L46_2
  L2_2[45] = L47_2
  L2_2[46] = L48_2
  L2_2[47] = L49_2
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = ipairs
  L8_2 = L2_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = #L11_2
    if L12_2 == 4 then
      L4_2 = L11_2[1]
      L3_2 = L11_2[2]
      L5_2 = L11_2[3]
      L6_2 = L11_2[4]
      if L4_2 ~= nil and L3_2 ~= nil and L5_2 ~= nil and L6_2 ~= nil then
        if L4_2 ~= "" then
          L12_2 = string
          L12_2 = L12_2.find
          L13_2 = A1_2
          L14_2 = L4_2
          L15_2 = #L4_2
          L15_2 = -1 * L15_2
          L16_2 = true
          L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
          if not L12_2 then
            goto lbl_355
          end
        end
        if L5_2 == -1 then
          L12_2 = string
          L12_2 = L12_2.find
          L13_2 = A0_2
          L14_2 = L3_2
          L15_2 = #L3_2
          L15_2 = L15_2 + L6_2
          L15_2 = L5_2 * L15_2
          L16_2 = true
          L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
          if L12_2 then
            goto lbl_353
          end
        end
        if L5_2 == 1 then
          L12_2 = string
          L12_2 = L12_2.find
          L13_2 = A0_2
          L14_2 = L3_2
          L15_2 = L5_2 + L6_2
          L16_2 = true
          L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
          ::lbl_353::
          if L12_2 then
            L12_2 = true
            return L12_2
          end
        end
      end
    end
    ::lbl_355::
  end
  L7_2 = false
  return L7_2
end

IsExcludedForXplatHeuristicTrigger = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "string" and A0_2 == "" then
    L2_2 = true
    return L2_2
  end
  if L1_2 == "table" then
    L2_2 = next
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  if L1_2 == "nil" then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

isnull = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2
  if A0_2 ~= nil then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "string" then
      goto lbl_10
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_10::
  L1_2 = {}
  L2_2 = "powersploit"
  L3_2 = "powertools"
  L4_2 = "powershellempire"
  L5_2 = "empireproject//empire"
  L6_2 = "nishang"
  L7_2 = "offensive-powershell"
  L8_2 = "powercat"
  L9_2 = "psattackbuildtool"
  L10_2 = "exploit-jmxconsole"
  L11_2 = "invoke-psuacme"
  L12_2 = "invoke-reflectivepeinjection"
  L13_2 = "invoke-voicetroll"
  L14_2 = "invoke-paranoia"
  L15_2 = "invoke-processhunterthreaded"
  L16_2 = "invoke-kerberoast"
  L17_2 = "invoke-stealthuserhunter"
  L18_2 = "invoke-postexfil"
  L19_2 = "invoke-poshrathttp"
  L20_2 = "invoke-passwordsprayowa"
  L21_2 = "invoke-massmimikatz"
  L22_2 = "invoke-dllinjection"
  L23_2 = "invoke-shellcodemsil"
  L24_2 = "invoke-processhunter"
  L25_2 = "invoke-whitneykatz"
  L26_2 = "invoke-wmiobfuscatedpscommand"
  L27_2 = "invoke-credentialinjection"
  L28_2 = "invoke-netripper"
  L29_2 = "invoke-lswmimplant"
  L30_2 = "invoke-scomdecrypt"
  L31_2 = "invoke-usernameharvestowa"
  L32_2 = "invoke-backdoorlnk"
  L33_2 = "invoke-bloodhound"
  L34_2 = "invoke-thunderstruck"
  L35_2 = "invoke-poshrathttps"
  L36_2 = "invoke-adsbackdoor"
  L37_2 = "invoke-credentialsphish"
  L38_2 = "invoke-powershelltcp"
  L39_2 = "invoke-sharedfinder"
  L40_2 = "invoke-mimikatz"
  L41_2 = "invoke-callbackiex"
  L42_2 = "invoke-mimikatzwdigestdowngrade"
  L43_2 = "invoke-jsratrundll"
  L44_2 = "invoke-ninjacopy"
  L45_2 = "invoke-smbscanner"
  L46_2 = "invoke-findpathhijack"
  L47_2 = "invoke-dcsync"
  L48_2 = "invoke-networkrelay"
  L49_2 = "invoke-mapdomaintrusts"
  L50_2 = "invoke-mapdomaintrustsldap"
  L51_2 = "invoke-servicedisable"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L1_2[12] = L13_2
  L1_2[13] = L14_2
  L1_2[14] = L15_2
  L1_2[15] = L16_2
  L1_2[16] = L17_2
  L1_2[17] = L18_2
  L1_2[18] = L19_2
  L1_2[19] = L20_2
  L1_2[20] = L21_2
  L1_2[21] = L22_2
  L1_2[22] = L23_2
  L1_2[23] = L24_2
  L1_2[24] = L25_2
  L1_2[25] = L26_2
  L1_2[26] = L27_2
  L1_2[27] = L28_2
  L1_2[28] = L29_2
  L1_2[29] = L30_2
  L1_2[30] = L31_2
  L1_2[31] = L32_2
  L1_2[32] = L33_2
  L1_2[33] = L34_2
  L1_2[34] = L35_2
  L1_2[35] = L36_2
  L1_2[36] = L37_2
  L1_2[37] = L38_2
  L1_2[38] = L39_2
  L1_2[39] = L40_2
  L1_2[40] = L41_2
  L1_2[41] = L42_2
  L1_2[42] = L43_2
  L1_2[43] = L44_2
  L1_2[44] = L45_2
  L1_2[45] = L46_2
  L1_2[46] = L47_2
  L1_2[47] = L48_2
  L1_2[48] = L49_2
  L1_2[49] = L50_2
  L1_2[50] = L51_2
  L2_2 = "invoke-filefinderthreaded"
  L3_2 = "invoke-userprocesshunter"
  L4_2 = "invoke-serviceenable"
  L5_2 = "invoke-portscan"
  L6_2 = "invoke-powershelltcponeline"
  L7_2 = "invoke-checklocaladminaccess"
  L8_2 = "invoke-callbackloop"
  L9_2 = "invoke-wscripttrigger"
  L10_2 = "invoke-wscriptelevate"
  L11_2 = "invoke-powerdump"
  L12_2 = "invoke-computerfieldsearch"
  L13_2 = "invoke-gofetch"
  L14_2 = "invoke-searchfiles"
  L15_2 = "invoke-filetransferwmimplant"
  L16_2 = "invoke-wcmdump"
  L17_2 = "invoke-enumsecuritytools"
  L18_2 = "invoke-jsratregsvr"
  L19_2 = "invoke-bruteforce"
  L20_2 = "invoke-empire"
  L21_2 = "invoke-processpunisher"
  L22_2 = "invoke-wmimplant"
  L23_2 = "invoke-loadpe"
  L24_2 = "invoke-shellcode"
  L25_2 = "invoke-reversednslookup"
  L26_2 = "invoke-psinject"
  L27_2 = "invoke-finddllhijack"
  L28_2 = "invoke-amsibypass"
  L29_2 = "invoke-arpscan"
  L30_2 = "invoke-domainharvestowa"
  L31_2 = "invoke-userhunter"
  L32_2 = "invoke-passwordsprayews"
  L33_2 = "invoke-wscriptbypassuac"
  L34_2 = "invoke-enumeratelocaladmin"
  L35_2 = "invoke-usereventhunter"
  L36_2 = "invoke-servicestop"
  L37_2 = "invoke-powershelludp"
  L38_2 = "invoke-findlocaladminaccessthreaded"
  L39_2 = "invoke-reverttoself"
  L40_2 = "invoke-powershelludponeline"
  L41_2 = "invoke-memoryloadlibrary"
  L42_2 = "invoke-findlocaladminaccess"
  L43_2 = "invoke-memoryfreelibrary"
  L44_2 = "invoke-servicecmd"
  L45_2 = "invoke-findallusertrustgroups"
  L46_2 = "invoke-enumeratelocaltrustgroups"
  L47_2 = "invoke-serviceuseradd"
  L48_2 = "invoke-inveigh"
  L49_2 = "invoke-sendmail"
  L50_2 = "invoke-powershellicmp"
  L51_2 = "invoke-packetknock"
  L1_2[51] = L2_2
  L1_2[52] = L3_2
  L1_2[53] = L4_2
  L1_2[54] = L5_2
  L1_2[55] = L6_2
  L1_2[56] = L7_2
  L1_2[57] = L8_2
  L1_2[58] = L9_2
  L1_2[59] = L10_2
  L1_2[60] = L11_2
  L1_2[61] = L12_2
  L1_2[62] = L13_2
  L1_2[63] = L14_2
  L1_2[64] = L15_2
  L1_2[65] = L16_2
  L1_2[66] = L17_2
  L1_2[67] = L18_2
  L1_2[68] = L19_2
  L1_2[69] = L20_2
  L1_2[70] = L21_2
  L1_2[71] = L22_2
  L1_2[72] = L23_2
  L1_2[73] = L24_2
  L1_2[74] = L25_2
  L1_2[75] = L26_2
  L1_2[76] = L27_2
  L1_2[77] = L28_2
  L1_2[78] = L29_2
  L1_2[79] = L30_2
  L1_2[80] = L31_2
  L1_2[81] = L32_2
  L1_2[82] = L33_2
  L1_2[83] = L34_2
  L1_2[84] = L35_2
  L1_2[85] = L36_2
  L1_2[86] = L37_2
  L1_2[87] = L38_2
  L1_2[88] = L39_2
  L1_2[89] = L40_2
  L1_2[90] = L41_2
  L1_2[91] = L42_2
  L1_2[92] = L43_2
  L1_2[93] = L44_2
  L1_2[94] = L45_2
  L1_2[95] = L46_2
  L1_2[96] = L47_2
  L1_2[97] = L48_2
  L1_2[98] = L49_2
  L1_2[99] = L50_2
  L1_2[100] = L51_2
  L2_2 = "invoke-psgcatagent"
  L3_2 = "invoke-filedownloader"
  L4_2 = "invoke-tokenmanipulation"
  L5_2 = "invoke-userview"
  L6_2 = "invoke-phant0m"
  L7_2 = "invoke-impersonateuser"
  L8_2 = "invoke-createremotethread"
  L9_2 = "invoke-filesearch"
  L10_2 = "invoke-winenum"
  L11_2 = "invoke-dnsloop"
  L12_2 = "invoke-searchgal"
  L13_2 = "invoke-enumeratelocaladmins"
  L14_2 = "invoke-enumeratelocaltrustgroupsthreaded"
  L15_2 = "invoke-netviewthreaded"
  L16_2 = "invoke-inveighrelay"
  L17_2 = "invoke-checkwrite"
  L18_2 = "invoke-threadedfunction"
  L19_2 = "invoke-hostenum"
  L20_2 = "invoke-findallgrouptrustusers"
  L21_2 = "invoke-servicestart"
  L22_2 = "invoke-bypassuac"
  L23_2 = "invoke-aclscanner"
  L24_2 = "invoke-patchdll"
  L25_2 = "invoke-mailsearch"
  L26_2 = "invoke-userhunterthreaded"
  L27_2 = "invoke-sharefinderthreaded"
  L28_2 = "invoke-userfieldsearch"
  L29_2 = "invoke-mapdomaintrust"
  L30_2 = "invoke-enumeratelocaladminsthreaded"
  L31_2 = "invoke-findusertrustgroups"
  L32_2 = "invoke-sharefinder"
  L33_2 = "invoke-portbind"
  L34_2 = "invoke-psexeccmd"
  L35_2 = "invoke-allchecks"
  L36_2 = "invoke-powershellwmi"
  L37_2 = "invoke-psgcat"
  L38_2 = "invoke-findgrouptrustusers"
  L39_2 = "invoke-downgradeaccount"
  L40_2 = "invoke-eventhunter"
  L41_2 = "invoke-userhunter"
  L42_2 = "invoke-processhunter"
  L43_2 = "invoke-sharefinder"
  L44_2 = "invoke-mapdomaintrust"
  L45_2 = "invoke-enumeratelocaladmin"
  L46_2 = "invoke-checklocaladminaccess"
  L47_2 = "invoke-threadedfunction"
  L48_2 = "invoke-zerologon\226\128\139"
  L49_2 = "invoke-rubeus"
  L50_2 = "invoke-cleverspray"
  L51_2 = "new-powercat"
  L1_2[101] = L2_2
  L1_2[102] = L3_2
  L1_2[103] = L4_2
  L1_2[104] = L5_2
  L1_2[105] = L6_2
  L1_2[106] = L7_2
  L1_2[107] = L8_2
  L1_2[108] = L9_2
  L1_2[109] = L10_2
  L1_2[110] = L11_2
  L1_2[111] = L12_2
  L1_2[112] = L13_2
  L1_2[113] = L14_2
  L1_2[114] = L15_2
  L1_2[115] = L16_2
  L1_2[116] = L17_2
  L1_2[117] = L18_2
  L1_2[118] = L19_2
  L1_2[119] = L20_2
  L1_2[120] = L21_2
  L1_2[121] = L22_2
  L1_2[122] = L23_2
  L1_2[123] = L24_2
  L1_2[124] = L25_2
  L1_2[125] = L26_2
  L1_2[126] = L27_2
  L1_2[127] = L28_2
  L1_2[128] = L29_2
  L1_2[129] = L30_2
  L1_2[130] = L31_2
  L1_2[131] = L32_2
  L1_2[132] = L33_2
  L1_2[133] = L34_2
  L1_2[134] = L35_2
  L1_2[135] = L36_2
  L1_2[136] = L37_2
  L1_2[137] = L38_2
  L1_2[138] = L39_2
  L1_2[139] = L40_2
  L1_2[140] = L41_2
  L1_2[141] = L42_2
  L1_2[142] = L43_2
  L1_2[143] = L44_2
  L1_2[144] = L45_2
  L1_2[145] = L46_2
  L1_2[146] = L47_2
  L1_2[147] = L48_2
  L1_2[148] = L49_2
  L1_2[149] = L50_2
  L1_2[150] = L51_2
  L2_2 = "do-exfiltration"
  L3_2 = "inject-portableexecutable"
  L4_2 = "show-targetscreen"
  L5_2 = "new-honeyhash"
  L6_2 = "inject-bypassstuff"
  L7_2 = "remove-poshrat"
  L8_2 = "inject-netripper"
  L9_2 = "get-vulnautorun"
  L10_2 = "add-exfiltration"
  L11_2 = "show-wmimplantmainmenu"
  L12_2 = "get-processlistingwmimplant"
  L13_2 = "get-filecontentswmimplant"
  L14_2 = "start-powercat"
  L15_2 = "find-filewmimplant"
  L16_2 = "find-pathhijack"
  L17_2 = "get-lsasecret"
  L18_2 = "get-foxdump"
  L19_2 = "connect-powercat"
  L20_2 = "set-masterbootrecord"
  L21_2 = "http-backdoor"
  L22_2 = "inject-remoteshellcode"
  L23_2 = "configure-victim"
  L24_2 = "execute-dnstxt-code"
  L25_2 = "find-dllhijack"
  L26_2 = "snifferspoofer"
  L27_2 = "gupt-backdoor"
  L28_2 = "exploit-jboss"
  L29_2 = "write-hijackdll"
  L30_2 = "set-samaccountpasswordhash"
  L31_2 = "dns_txt_pwnage"
  L32_2 = "inject-localshellcode"
  L33_2 = "add-scrnsavebackdoor"
  L34_2 = "get-keepassdatabasekey"
  L35_2 = "get-passhashes"
  L36_2 = "add-regbackdoor"
  L37_2 = "get-modifiablefile"
  L38_2 = "get-psadforestkrbtgtinfo"
  L39_2 = "get-vulnschtask"
  L40_2 = "parse-ilhosts"
  L41_2 = "write-bytestomemory"
  L42_2 = "smbrelayexecute"
  L43_2 = "copy-arrayofmemaddresses"
  L44_2 = "find-fruit"
  L45_2 = "create-remotethread"
  L46_2 = "get-uniquetokens"
  L47_2 = "write-cmdservicebinary"
  L48_2 = "decrypthashes"
  L49_2 = "select-emailitem"
  L50_2 = "get-remoteprocaddress"
  L51_2 = "set-desktopacltoalloweveryone"
  L1_2[151] = L2_2
  L1_2[152] = L3_2
  L1_2[153] = L4_2
  L1_2[154] = L5_2
  L1_2[155] = L6_2
  L1_2[156] = L7_2
  L1_2[157] = L8_2
  L1_2[158] = L9_2
  L1_2[159] = L10_2
  L1_2[160] = L11_2
  L1_2[161] = L12_2
  L1_2[162] = L13_2
  L1_2[163] = L14_2
  L1_2[164] = L15_2
  L1_2[165] = L16_2
  L1_2[166] = L17_2
  L1_2[167] = L18_2
  L1_2[168] = L19_2
  L1_2[169] = L20_2
  L1_2[170] = L21_2
  L1_2[171] = L22_2
  L1_2[172] = L23_2
  L1_2[173] = L24_2
  L1_2[174] = L25_2
  L1_2[175] = L26_2
  L1_2[176] = L27_2
  L1_2[177] = L28_2
  L1_2[178] = L29_2
  L1_2[179] = L30_2
  L1_2[180] = L31_2
  L1_2[181] = L32_2
  L1_2[182] = L33_2
  L1_2[183] = L34_2
  L1_2[184] = L35_2
  L1_2[185] = L36_2
  L1_2[186] = L37_2
  L1_2[187] = L38_2
  L1_2[188] = L39_2
  L1_2[189] = L40_2
  L1_2[190] = L41_2
  L1_2[191] = L42_2
  L1_2[192] = L43_2
  L1_2[193] = L44_2
  L1_2[194] = L45_2
  L1_2[195] = L46_2
  L1_2[196] = L47_2
  L1_2[197] = L48_2
  L1_2[198] = L49_2
  L1_2[199] = L50_2
  L1_2[200] = L51_2
  L2_2 = "get-memoryprocaddress"
  L3_2 = "remove-persistence"
  L4_2 = "start-agentjob"
  L5_2 = "get-unattendedinstallfiles"
  L6_2 = "get-topport"
  L7_2 = "get-iecookies"
  L8_2 = "disable-securitysettings"
  L9_2 = "elevateprivs"
  L10_2 = "get-pebasicinfo"
  L11_2 = "portscan-alive"
  L12_2 = "reset-securitysettings"
  L13_2 = "get-entropy"
  L14_2 = "dumphashes"
  L15_2 = "write-serviceexe"
  L16_2 = "get-lostlimit"
  L17_2 = "get-regautologon"
  L18_2 = "unregister-processmoduletrace"
  L19_2 = "enable-duplicatetoken"
  L20_2 = "copy-clonedfile"
  L21_2 = "new-dllexportfunction"
  L22_2 = "discover-psmsexchangeservers"
  L23_2 = "find-psserviceaccounts"
  L24_2 = "get-chromedump"
  L25_2 = "get-tokeninformation"
  L26_2 = "get-ildisassembly"
  L27_2 = "get-psadforestinfo"
  L28_2 = "get-keystrokes"
  L29_2 = "get-procaddress"
  L30_2 = "get-gppinnerfields"
  L31_2 = "smbrelayresponse"
  L32_2 = "get-pearchitecture"
  L33_2 = "get-processmemoryinfo"
  L34_2 = "parse-ports"
  L35_2 = "get-usertgtevents"
  L36_2 = "write-portscanout"
  L37_2 = "set-macattribute"
  L38_2 = "create-multiplesessions"
  L39_2 = "smbntlmchallenge"
  L40_2 = "write-useraddmsi"
  L41_2 = "out-encryptedscript"
  L42_2 = "get-wlan-keys"
  L43_2 = "get-systemdnsserver"
  L44_2 = "get-primarytoken"
  L45_2 = "export-powerviewcsv"
  L46_2 = "injecturl2download"
  L47_2 = "get-imagentheaders"
  L48_2 = "download-execute-ps"
  L49_2 = "remove-ports"
  L50_2 = "copy-sections"
  L51_2 = "decryptsinglehash"
  L1_2[201] = L2_2
  L1_2[202] = L3_2
  L1_2[203] = L4_2
  L1_2[204] = L5_2
  L1_2[205] = L6_2
  L1_2[206] = L7_2
  L1_2[207] = L8_2
  L1_2[208] = L9_2
  L1_2[209] = L10_2
  L1_2[210] = L11_2
  L1_2[211] = L12_2
  L1_2[212] = L13_2
  L1_2[213] = L14_2
  L1_2[214] = L15_2
  L1_2[215] = L16_2
  L1_2[216] = L17_2
  L1_2[217] = L18_2
  L1_2[218] = L19_2
  L1_2[219] = L20_2
  L1_2[220] = L21_2
  L1_2[221] = L22_2
  L1_2[222] = L23_2
  L1_2[223] = L24_2
  L1_2[224] = L25_2
  L1_2[225] = L26_2
  L1_2[226] = L27_2
  L1_2[227] = L28_2
  L1_2[228] = L29_2
  L1_2[229] = L30_2
  L1_2[230] = L31_2
  L1_2[231] = L32_2
  L1_2[232] = L33_2
  L1_2[233] = L34_2
  L1_2[234] = L35_2
  L1_2[235] = L36_2
  L1_2[236] = L37_2
  L1_2[237] = L38_2
  L1_2[238] = L39_2
  L1_2[239] = L40_2
  L1_2[240] = L41_2
  L1_2[241] = L42_2
  L1_2[242] = L43_2
  L1_2[243] = L44_2
  L1_2[244] = L45_2
  L1_2[245] = L46_2
  L1_2[246] = L47_2
  L1_2[247] = L48_2
  L1_2[248] = L49_2
  L1_2[249] = L50_2
  L1_2[250] = L51_2
  L2_2 = "smbrelaychallenge"
  L3_2 = "restore-serviceexe"
  L4_2 = "set-killdate"
  L5_2 = "get-vaultelementvalue"
  L6_2 = "update-memoryprotectionflags"
  L7_2 = "set-desktopacls"
  L8_2 = "getwsusconfiguration"
  L9_2 = "get-methodaddress"
  L10_2 = "get-hbootkey"
  L11_2 = "get-unattendedinstallfile"
  L12_2 = "start-negotiate"
  L13_2 = "get-ntsysteminformation"
  L14_2 = "parse-hosts"
  L15_2 = "get-virtualprotectvalue"
  L16_2 = "find-processpes"
  L17_2 = "free-alltokens"
  L18_2 = "get-ffxandchromecookies"
  L19_2 = "import-dllinremoteprocess"
  L20_2 = "update-memoryaddresses"
  L21_2 = "create-processwithtoken"
  L22_2 = "portscan-port"
  L23_2 = "get-assemblyimplementedmethods"
  L24_2 = "write-useraddservicebinary"
  L25_2 = "get-userhashes"
  L26_2 = "powerpreter"
  L27_2 = "find-interestingfile"
  L28_2 = "find-4648logons"
  L29_2 = "get-pedetailedinfo"
  L30_2 = "decrypt-ciphertext"
  L31_2 = "discover-psinterestingservices"
  L32_2 = "write-serviceexecmd"
  L33_2 = "enum-alltokens"
  L34_2 = "get-serviceunquoted"
  L35_2 = "emit-callthreadstub"
  L36_2 = "get-serviceexeperms"
  L37_2 = "find-4624logons"
  L38_2 = "process-tasking"
  L39_2 = "find-avsignature"
  L40_2 = "set-criticalprocess"
  L41_2 = "get-vaultcredential"
  L42_2 = "smbntlmresponse"
  L43_2 = "get-shuffledarray"
  L44_2 = "parse-ipports"
  L45_2 = "find-localadminaccess"
  L46_2 = "ntlmchallengebase64"
  L47_2 = "download_execute"
  L48_2 = "process-packet"
  L49_2 = "get-killdate"
  L50_2 = "get-decryptedcpassword"
  L51_2 = "register-processmoduletrace"
  L1_2[251] = L2_2
  L1_2[252] = L3_2
  L1_2[253] = L4_2
  L1_2[254] = L5_2
  L1_2[255] = L6_2
  L1_2[256] = L7_2
  L1_2[257] = L8_2
  L1_2[258] = L9_2
  L1_2[259] = L10_2
  L1_2[260] = L11_2
  L1_2[261] = L12_2
  L1_2[262] = L13_2
  L1_2[263] = L14_2
  L1_2[264] = L15_2
  L1_2[265] = L16_2
  L1_2[266] = L17_2
  L1_2[267] = L18_2
  L1_2[268] = L19_2
  L1_2[269] = L20_2
  L1_2[270] = L21_2
  L1_2[271] = L22_2
  L1_2[272] = L23_2
  L1_2[273] = L24_2
  L1_2[274] = L25_2
  L1_2[275] = L26_2
  L1_2[276] = L27_2
  L1_2[277] = L28_2
  L1_2[278] = L29_2
  L1_2[279] = L30_2
  L1_2[280] = L31_2
  L1_2[281] = L32_2
  L1_2[282] = L33_2
  L1_2[283] = L34_2
  L1_2[284] = L35_2
  L1_2[285] = L36_2
  L1_2[286] = L37_2
  L1_2[287] = L38_2
  L1_2[288] = L39_2
  L1_2[289] = L40_2
  L1_2[290] = L41_2
  L1_2[291] = L42_2
  L1_2[292] = L43_2
  L1_2[293] = L44_2
  L1_2[294] = L45_2
  L1_2[295] = L46_2
  L1_2[296] = L47_2
  L1_2[297] = L48_2
  L1_2[298] = L49_2
  L1_2[299] = L50_2
  L1_2[300] = L51_2
  L2_2 = "discover-psmssqlservers"
  L3_2 = "load-libraryfrommemory"
  L4_2 = "run-exeonremote"
  L5_2 = "new-inmemorymodule"
  L6_2 = "sid_to_key"
  L7_2 = "get-passhints"
  L8_2 = "get-exploitablesystem"
  L9_2 = "get-netforestdomain"
  L10_2 = "get-netdomaincontroller"
  L11_2 = "get-netuser"
  L12_2 = "add-netuser"
  L13_2 = "add-netgroupuser"
  L14_2 = "get-netcomputer"
  L15_2 = "get-netou"
  L16_2 = "get-netfileserver"
  L17_2 = "get-netsession"
  L18_2 = "get-netrdpsession"
  L19_2 = "get-netprocess"
  L20_2 = "get-userevent"
  L21_2 = "get-userproperty"
  L22_2 = "get-computerproperty"
  L23_2 = "find-interestingfile"
  L24_2 = "find-userfield"
  L25_2 = "find-computerfield"
  L26_2 = "find-localadminaccess"
  L27_2 = "get-netdomaintrust"
  L28_2 = "get-netforesttrust"
  L29_2 = "find-foreignuser"
  L30_2 = "find-foreigngroup"
  L31_2 = "get-exploitablesystem"
  L32_2 = "invoke-totalexec"
  L1_2[301] = L2_2
  L1_2[302] = L3_2
  L1_2[303] = L4_2
  L1_2[304] = L5_2
  L1_2[305] = L6_2
  L1_2[306] = L7_2
  L1_2[307] = L8_2
  L1_2[308] = L9_2
  L1_2[309] = L10_2
  L1_2[310] = L11_2
  L1_2[311] = L12_2
  L1_2[312] = L13_2
  L1_2[313] = L14_2
  L1_2[314] = L15_2
  L1_2[315] = L16_2
  L1_2[316] = L17_2
  L1_2[317] = L18_2
  L1_2[318] = L19_2
  L1_2[319] = L20_2
  L1_2[320] = L21_2
  L1_2[321] = L22_2
  L1_2[322] = L23_2
  L1_2[323] = L24_2
  L1_2[324] = L25_2
  L1_2[325] = L26_2
  L1_2[326] = L27_2
  L1_2[327] = L28_2
  L1_2[328] = L29_2
  L1_2[329] = L30_2
  L1_2[330] = L31_2
  L1_2[331] = L32_2
  L2_2 = contains
  L3_2 = A0_2
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

IsSuspPSModule = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "Microsoft.Exchange.Store.Service.exe"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "ExchgVersion"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = "ExchgVersion"
    L3_2 = 604800
    L4_2 = sysio
    L4_2 = L4_2.RegOpenKey
    L5_2 = "HKLM\\Software\\Microsoft\\ExchangeServer\\V15\\Setup"
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L5_2 = sysio
      L5_2 = L5_2.RegOpenKey
      L6_2 = "HKLM\\Software\\Microsoft\\ExchangeServer\\V14\\Setup"
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
    end
    if not L4_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = sysio
    L5_2 = L5_2.GetRegValueAsString
    L6_2 = L4_2
    L7_2 = "OwaVersion"
    L5_2 = L5_2(L6_2, L7_2)
    L1_2 = L5_2
    if not L1_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = AppendToRollingQueue
    L6_2 = L2_2
    L7_2 = L0_2
    L8_2 = L1_2
    L9_2 = L3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  return L1_2
end

IsExchangeServer = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "WebServerExtensions_WSS"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "SPVersion"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = "SPVersion"
    L3_2 = nil
    L4_2 = 604800
    L5_2 = {}
    L6_2 = "14.0"
    L7_2 = "15.0"
    L8_2 = "16.0"
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = ipairs
    L7_2 = L5_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      L11_2 = sysio
      L11_2 = L11_2.RegOpenKey
      L12_2 = "HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
      L13_2 = L10_2
      L14_2 = "\\WSS"
      L12_2 = L12_2 .. L13_2 .. L14_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L12_2 = sysio
        L12_2 = L12_2.RegOpenKey
        L13_2 = "HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
        L14_2 = L10_2
        L13_2 = L13_2 .. L14_2
        L12_2 = L12_2(L13_2)
        L3_2 = L12_2
      end
    end
    if not L3_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = sysio
    L6_2 = L6_2.GetRegValueAsString
    L7_2 = L3_2
    L8_2 = "Version"
    L6_2 = L6_2(L7_2, L8_2)
    L1_2 = L6_2
    if not L1_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = AppendToRollingQueue
    L7_2 = L2_2
    L8_2 = L0_2
    L9_2 = L1_2
    L10_2 = L4_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  return L1_2
end

IsSharepointServer = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "AD-Domain-Services"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "ActiveDirRole"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 ~= nil then
    L2_2 = true
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.GetServerRoles
  L2_2 = L2_2()
  if L2_2 ~= nil then
    L3_2 = ipairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      if L7_2 == "DirectoryServices-DomainController" then
        L8_2 = "ActiveDirRole"
        L9_2 = 604800
        L10_2 = sysio
        L10_2 = L10_2.GetCommandLineFromService
        L11_2 = "NTDS"
        L10_2 = L10_2(L11_2)
        if not L10_2 then
          L11_2 = false
          return L11_2
        end
        L11_2 = string
        L11_2 = L11_2.find
        L12_2 = L10_2
        L13_2 = "lsass.exe"
        L14_2 = 1
        L15_2 = true
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
        if not L11_2 then
          L11_2 = false
          return L11_2
        end
        L11_2 = AppendToRollingQueue
        L12_2 = L8_2
        L13_2 = L0_2
        L14_2 = 1
        L15_2 = L9_2
        L11_2(L12_2, L13_2, L14_2, L15_2)
        L11_2 = true
        return L11_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

IsActiveDirectoryRole = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "Microsoft.Azure.ActiveDirectory.ADSyncManagement.Server"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "ADConnect"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = "ADConnect"
    L3_2 = 86400
    L4_2 = sysio
    L4_2 = L4_2.GetCommandLineFromService
    L5_2 = "ADSync"
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = L4_2
    L7_2 = "miiserver.exe"
    L8_2 = 1
    L9_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = AppendToRollingQueue
    L6_2 = L2_2
    L7_2 = L0_2
    L8_2 = 1
    L9_2 = L3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L2_2 = true
  return L2_2
end

IsADConnectRole = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "AADConnectProvisioningAgent"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "ADConnectCloudSync"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = "ADConnectCloudSync"
    L3_2 = 86400
    L4_2 = sysio
    L4_2 = L4_2.GetCommandLineFromService
    L5_2 = "AADConnectProvisioningAgent"
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = L4_2
    L7_2 = "AADConnectProvisioningAgent.exe"
    L8_2 = 1
    L9_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = AppendToRollingQueue
    L6_2 = L2_2
    L7_2 = L0_2
    L8_2 = 1
    L9_2 = L3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L2_2 = true
  return L2_2
end

IsADConnectCloudSyncRole = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = "Microsoft.IdentityServer.ServiceHost"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = "ADFSService"
  L3_2 = L0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = "ADFSService"
    L3_2 = 86400
    L4_2 = sysio
    L4_2 = L4_2.GetCommandLineFromService
    L5_2 = "adfssrv"
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = L4_2
    L7_2 = "Microsoft.IdentityServer.ServiceHost.exe"
    L8_2 = 1
    L9_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
    L5_2 = AppendToRollingQueue
    L6_2 = L2_2
    L7_2 = L0_2
    L8_2 = 1
    L9_2 = L3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L2_2 = true
  return L2_2
end

IsADFSRole = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = sysio
  L0_2 = L0_2.GetCommandLineFromService
  L1_2 = "CertSvc"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = "\\windows\\system32\\certsrv.exe"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end

IsADCSRole = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = versioning
  L0_2 = L0_2.IsServer
  L0_2 = L0_2()
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = sysio
  L0_2 = L0_2.GetCommandLineFromService
  L1_2 = "VeeamBackupSvc"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = L0_2
  L3_2 = "Veeam.Backup.Service.exe"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end

IsVeeamRole = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = false
  L4_2 = ""
  L5_2 = -9223372036854775808
  L6_2 = pairs
  L7_2 = A2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    if L9_2 <= A0_2 then
      L11_2 = A0_2 - A1_2
      if L9_2 > L11_2 and L9_2 > L5_2 then
        L3_2 = true
        L4_2 = L10_2
        L5_2 = L9_2
      end
    end
  end
  L6_2 = L3_2
  L7_2 = L4_2
  return L6_2, L7_2
end

CheckNewThresholdMet = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = sms_untrusted_process
  L3_2()
  L3_2 = reportSessionInformation
  L3_2()
  L3_2 = reportTimingData
  L3_2()
  L3_2 = GetRollingQueue
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = bm
  L4_2 = L4_2.add_related_string
  L5_2 = "MassRecon_"
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = safeJsonSerialize
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L7_2 = bm
  L7_2 = L7_2.RelatedStringBMReport
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = explode
    L10_2 = L8_2.key
    L11_2 = "|"
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = {}
    L11_2 = L9_2[1]
    L10_2.parentPPID = L11_2
    L11_2 = L9_2[2]
    L10_2.processPPID = L11_2
    L11_2 = L9_2[3]
    L10_2.process_image = L11_2
    L11_2 = L9_2[4]
    L10_2.process_cmd = L11_2
    L8_2.key = L10_2
    L10_2 = bm
    L10_2 = L10_2.add_related_file
    L11_2 = L9_2[3]
    L10_2(L11_2)
    L10_2 = bm
    L10_2 = L10_2.add_related_process
    L11_2 = L9_2[1]
    L10_2(L11_2)
    L10_2 = bm
    L10_2 = L10_2.add_related_process
    L11_2 = L9_2[2]
    L10_2(L11_2)
  end
end

reportMassReconHistory = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = "matched"
  L4_2 = "timestamp"
  L5_2 = "ppid"
  L6_2 = "image_path"
  L7_2 = "reg_block_src"
  L8_2 = "reg_block_usermode"
  L9_2 = "attribute"
  L10_2 = "p1"
  L11_2 = "p2"
  L12_2 = "np1"
  L13_2 = "np2"
  L14_2 = "wp1"
  L15_2 = "wp2"
  L16_2 = "utf8p1"
  L17_2 = "utf8p2"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = A0_2[L7_2]
    L1_2[L7_2] = L8_2
  end
  return L1_2
end

copyBMEvent = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L0_2 = pcall
  L1_2 = bm
  L1_2 = L1_2.get_process_relationships
  L0_2, L1_2, L2_2 = L0_2(L1_2)
  L3_2 = {}
  L4_2 = {}
  L4_2.count = 0
  L5_2 = {}
  L5_2.count = 0
  if L0_2 and L1_2 then
    L6_2 = ipairs
    L7_2 = L1_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      L11_2 = mp
      L11_2 = L11_2.bitand
      L12_2 = L10_2.reason
      L13_2 = 2
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 == 2 then
        L11_2 = pcall
        L12_2 = bm
        L12_2 = L12_2.get_process_relationships
        L13_2 = L10_2.ppid
        L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
        L14_2 = L10_2.ppid
        L15_2 = {}
        L3_2[L14_2] = L15_2
        L14_2 = L10_2.ppid
        L4_2[L14_2] = L10_2
        L14_2 = L4_2.count
        L14_2 = L14_2 + 1
        L4_2.count = L14_2
        if L11_2 and L13_2 then
          L14_2 = #L13_2
          if L14_2 ~= 0 then
            goto lbl_81
          end
        end
        L14_2 = GetRollingQueueKeyValues
        L15_2 = "InjectionRelationship"
        L16_2 = L10_2.ppid
        L14_2 = L14_2(L15_2, L16_2)
        if L14_2 then
          L15_2 = ipairs
          L16_2 = L14_2
          L15_2, L16_2, L17_2 = L15_2(L16_2)
          for L18_2, L19_2 in L15_2, L16_2, L17_2 do
            L20_2 = string
            L20_2 = L20_2.match
            L21_2 = L19_2.value
            L22_2 = "imagename:%s*(.-)%s*;targetprocessp(%d+:%d+);(injectiontype:%w+);"
            L20_2, L21_2, L22_2 = L20_2(L21_2, L22_2)
            if L21_2 then
              L23_2 = table
              L23_2 = L23_2.insert
              L24_2 = L10_2.ppid
              L24_2 = L3_2[L24_2]
              L25_2 = L21_2
              L23_2(L24_2, L25_2)
              L23_2 = L5_2[L21_2]
              if not L23_2 then
                L23_2 = {}
                L23_2.image_name = L20_2
                L23_2.injection_type = L22_2
                L5_2[L21_2] = L23_2
                L23_2 = L5_2.count
                L23_2 = L23_2 + 1
                L5_2.count = L23_2
              end
            end
          end
          goto lbl_109
          ::lbl_81::
          L14_2 = ipairs
          L15_2 = L13_2
          L14_2, L15_2, L16_2 = L14_2(L15_2)
          for L17_2, L18_2 in L14_2, L15_2, L16_2 do
            L19_2 = mp
            L19_2 = L19_2.bitand
            L20_2 = L18_2.reason
            L21_2 = 2
            L19_2 = L19_2(L20_2, L21_2)
            if L19_2 == 2 then
              L19_2 = table
              L19_2 = L19_2.insert
              L20_2 = L10_2.ppid
              L20_2 = L3_2[L20_2]
              L21_2 = L18_2.ppid
              L19_2(L20_2, L21_2)
              L19_2 = L18_2.ppid
              L19_2 = L5_2[L19_2]
              if not L19_2 then
                L19_2 = L18_2.ppid
                L5_2[L19_2] = L18_2
                L19_2 = L5_2.count
                L19_2 = L19_2 + 1
                L5_2.count = L19_2
              end
            end
          end
        end
      end
      ::lbl_109::
    end
  end
  L6_2 = L3_2
  L7_2 = L4_2
  L8_2 = L5_2
  return L6_2, L7_2, L8_2
end

getCurrentProcessInjectors = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L1_3 = ""
    L2_3 = #A0_3
    L3_3 = 1
    L4_3 = -2
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = L1_3
      L7_3 = string
      L7_3 = L7_3.sub
      L8_3 = A0_3
      L9_3 = L5_3 - 1
      L10_3 = L5_3
      L7_3 = L7_3(L8_3, L9_3, L10_3)
      L1_3 = L6_3 .. L7_3
    end
    return L1_3
  end
  
  L2_2 = tohex
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_2
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  while true do
    L3_2 = #L2_2
    if not (1 < L3_2) then
      break
    end
    L4_2 = L2_2
    L3_2 = L2_2.sub
    L5_2 = 1
    L6_2 = 1
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 ~= "0" then
      break
    end
    L4_2 = L2_2
    L3_2 = L2_2.sub
    L5_2 = 2
    L6_2 = -1
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2 = L3_2
  end
  return L2_2
end

readRegDQwordValue = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 then
    return
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = bm
  L1_2 = L1_2.get_process_relationships
  L1_2, L2_2 = L1_2()
  if not L1_2 then
    return
  end
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.ppid
    if L8_2 then
      L8_2 = L7_2.image_path
      if L8_2 then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = string
        L9_2 = L9_2.lower
        L10_2 = L7_2.image_path
        L9_2 = L9_2(L10_2)
        L10_2 = A0_2
        L11_2 = 1
        L12_2 = true
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        if L8_2 then
          L8_2 = L7_2.ppid
          return L8_2
        end
      end
    end
  end
  return
end

GetPidFromParentImagePath = L3_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = pcall
  L1_2 = bm
  L1_2 = L1_2.get_current_process_startup_info
  L0_2, L1_2 = L0_2(L1_2)
  if not L0_2 or not L1_2 then
    return
  end
  L2_2 = L1_2.ppid
  return L2_2
end

GetCurrentPpid = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = pcall
  L1_2 = bm
  L1_2 = L1_2.get_imagepath
  L0_2, L1_2 = L0_2(L1_2)
  if not L0_2 or not L1_2 then
    return
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = L1_2
  L4_2 = "([^\\]+)$"
  return L2_2(L3_2, L4_2)
end

GetCurrentProcessImageName = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = GetCurrentPpid
    L2_2 = L2_2()
  end
  if not L2_2 then
    return
  end
  L3_2 = bm
  L3_2 = L3_2.trigger_sig
  L4_2 = "C2Block"
  L5_2 = A0_2 or L5_2
  if not A0_2 or not A0_2 then
    L5_2 = ""
  end
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end

BlockC2Connection = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = GetCurrentPpid
    L2_2 = L2_2()
  end
  if not L2_2 then
    return
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "%s,address:%s,size:0"
  L5_2 = L2_2
  L6_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = mp
  L4_2 = L4_2.TriggerScanResource
  L5_2 = "ems"
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
end

TriggerTargetedMemoryScan = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = GetCurrentPpid
    L2_2 = L2_2()
  end
  if not L2_2 then
    return
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "susp_regions:%s"
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = IsKeyInRollingQueue
  L5_2 = L3_2
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = AppendToRollingQueue
    L5_2 = L3_2
    L6_2 = A0_2
    L7_2 = nil
    L8_2 = nil
    L9_2 = 8
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
end

AddSuspiciousRegion = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = mp
  L1_2 = L1_2.SIGATTR_LOG_SZ
  if L1_2 == 0 then
    return
  end
  
  function L1_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L2_3 = mp
    L2_3 = L2_3.SIGATTR_LOG_SZ
    L3_3 = 1
    L4_3 = -1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = A1_3[L5_3]
      L7_3 = L6_3.attribute
      if L7_3 == 16435 then
        L7_3 = L6_3.utf8p2
        L7_3 = A0_3[L7_3]
        if not L7_3 then
          L7_3 = L6_3.utf8p2
          A0_3[L7_3] = true
        end
      end
      L7_3 = L6_3.attribute
      if L7_3 == 16505 then
        L7_3 = string
        L7_3 = L7_3.match
        L8_3 = L6_3.utf8p2
        L9_3 = "(%d+);region"
        L7_3 = L7_3(L8_3, L9_3)
        L8_3 = A0_3[L7_3]
        if not L8_3 then
          A0_3[L7_3] = true
        end
      end
      L7_3 = L6_3.attribute
      if L7_3 == 16523 then
        L7_3 = L6_3.utf8p2
        L7_3 = A0_3[L7_3]
        if not L7_3 then
          L7_3 = L6_3.utf8p2
          A0_3[L7_3] = true
        end
      end
    end
  end
  
  L2_2 = {}
  L3_2 = L1_2
  L4_2 = L2_2
  L5_2 = sigattr_tail
  L3_2(L4_2, L5_2)
  L3_2 = L1_2
  L4_2 = L2_2
  L5_2 = sigattr_head
  L3_2(L4_2, L5_2)
  if A0_2 then
    L3_2 = 0
    L4_2 = pairs
    L5_2 = L2_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2 in L4_2, L5_2, L6_2 do
      L8_2 = bm
      L8_2 = L8_2.VirtualQuery
      L9_2 = L7_2
      L8_2, L9_2 = L8_2(L9_2)
      if L8_2 then
        L10_2 = string
        L10_2 = L10_2.format
        L11_2 = "s:%x,p:%x,i:%x,t:%x"
        L12_2 = L9_2.size
        L13_2 = L9_2.prot
        L14_2 = L9_2.alloc_prot
        L15_2 = L9_2.state_type
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        L3_2 = L3_2 + 1
        L11_2 = string
        L11_2 = L11_2.format
        L12_2 = "a40d39a6_%d"
        L13_2 = L3_2
        L11_2 = L11_2(L12_2, L13_2)
        L12_2 = bm
        L12_2 = L12_2.add_related_string
        L13_2 = L11_2
        L14_2 = L10_2
        L15_2 = bm
        L15_2 = L15_2.RelatedStringBMReport
        L12_2(L13_2, L14_2, L15_2)
      end
    end
    L4_2 = bm
    L4_2 = L4_2.add_related_string
    L5_2 = "a40d39a6_total"
    L6_2 = tostring
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L7_2 = bm
    L7_2 = L7_2.RelatedStringBMReport
    L4_2(L5_2, L6_2, L7_2)
  end
  return L2_2
end

GetSuspiciousAllocsInBmLog = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2 or nil
  if not A0_2 then
    L1_2 = GetCurrentPpid
    L1_2 = L1_2()
  end
  if not L1_2 then
    return
  end
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "susp_regions:%s"
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = GetRollingQueueKeys
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  return L3_2
end

GetSuspiciousRegions = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2 or nil
  if not A0_2 then
    L1_2 = GetCurrentPpid
    L1_2 = L1_2()
  end
  if not L1_2 then
    return
  end
  L2_2 = bm
  L2_2 = L2_2.trigger_sig
  L3_2 = "ScanSuspiciousRegions"
  L4_2 = L1_2
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
end

TriggerScanBeaconing = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L2_2 = A0_2.utf8p1
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = A0_2.utf8p2
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = L3_2
  L6_2 = "regionsize:(%d+)"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = string
  L5_2 = L5_2.match
  L6_2 = L3_2
  L7_2 = "vmbaseaddress:(%d+)"
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = string
  L6_2 = L6_2.match
  L7_2 = L3_2
  L8_2 = "injectiontype:(%a+);"
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L7_2 = false
    return L7_2
  end
  L7_2 = A1_2.utf8p2
  if not L7_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = string
  L8_2 = L8_2.match
  L9_2 = L7_2
  L10_2 = "injectiontype:(%a+);"
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L9_2 = false
    return L9_2
  end
  L9_2 = string
  L9_2 = L9_2.match
  L10_2 = L2_2
  L11_2 = "targetprocessppid:(%d+):(%d+)"
  L9_2, L10_2 = L9_2(L10_2, L11_2)
  if not L9_2 or not L10_2 then
    L11_2 = false
    return L11_2
  end
  L11_2 = bm
  L11_2 = L11_2.get_current_process_startup_info
  L11_2 = L11_2()
  L12_2 = L11_2.ppid
  if not L12_2 then
    L13_2 = false
    return L13_2
  end
  L13_2 = MpCommon
  L13_2 = L13_2.IsFriendlyProcess
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  if L13_2 then
    L13_2 = "1"
    if L13_2 then
      goto lbl_81
    end
  end
  L13_2 = "0"
  ::lbl_81::
  L14_2 = GetCurrentProcessImageName
  L14_2 = L14_2()
  L15_2 = string
  L15_2 = L15_2.match
  L16_2 = L2_2
  L17_2 = "imagename:(.+);"
  L15_2 = L15_2(L16_2, L17_2)
  if (L14_2 == "RunDll64.exe" or L15_2 == "RunDll64.exe") and (L4_2 == "950" or L4_2 == "995") and L8_2 == "remotethread" and L13_2 == "1" then
    L16_2 = false
    return L16_2
  end
  L16_2 = string
  L16_2 = L16_2.format
  L17_2 = "%s:%s:%s:%s:%s:%s"
  L18_2 = L14_2
  L19_2 = L15_2
  L20_2 = L8_2
  L21_2 = L6_2
  L22_2 = L4_2
  L23_2 = L13_2
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L17_2 = {}
  L17_2["msedge.exe:msedge.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["AcroRd32.exe:AcroRd32.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["svservice.exe:powershell.exe:queueuserapc:allocvmremote:578:1"] = true
  L17_2["RdrCEF.exe:RdrCEF.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["svservice.exe:svchost.exe:queueuserapc:allocvmremote:578:1"] = true
  L17_2["OfficeClickToRun.exe:msoadfsb.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["Acrobat.exe:Acrobat.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["RdrCEF.exe:RdrCEF.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:736:1"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:protectvm:800:1"] = true
  L17_2["powershell.exe:svservice.exe:queueuserapc:protectvm:578:1"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:protectvm:1312:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:allocvmremote:4096:0"] = true
  L17_2["ai.exe:OfficeClickToRun.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:protectvm:928:1"] = true
  L17_2["msedge.exe:core.exe:queueuserapc:allocvmremote:578:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:672:1"] = true
  L17_2["AcroCEF.exe:AcroCEF.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["java.exe:jcmd.exe:remotethread:allocvmremote:136:1"] = true
  L17_2["svchost.exe:svservice.exe:queueuserapc:protectvm:578:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["RdrCEF.exe:RdrCEF.exe:queueuserapc:protectvm:912:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["Spotify.exe:Spotify.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AcroRd32.exe:AcroRd32.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["jabra-direct.exe:jabra-direct.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["msedge.exe:core.exe:queueuserapc:allocvmremote:725:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:protectvm:4096:1"] = true
  L17_2["EXCEL.EXE:OfficeClickToRun.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["SIP.exe:powershell.exe:remotethread:protectvm:8192:1"] = true
  L17_2["jcmd.exe:java.exe:remotethread:allocvmremote:136:1"] = true
  L17_2["OfficeClickToRun.exe:ai.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["A180AG.exe:AcroRd32.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["MavInject32.exe:msoadfsb.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:166:0"] = true
  L17_2["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:160:0"] = true
  L17_2["IPScriptHost.exe:T.exe:remotethread:allocvmremote:100:1"] = true
  L17_2["SIP.exe:cmd.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:SelfService.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:ClearPassUSHARemediate.exe:remotethread:protectvm:8192:1"] = true
  L17_2["VeeamGuestHelper.exe:svchost.exe:remotethread:allocvmremote:44:1"] = true
  L17_2["OfficeClickToRun.exe:EXCEL.EXE:queueuserapc:protectvm:1024:1"] = true
  L17_2["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:170:0"] = true
  L17_2["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:164:0"] = true
  L17_2["Unattended.exe:explorer.exe:remotethread:allocvmremote:1360:1"] = true
  L17_2["SIP.exe:netsh.exe:remotethread:protectvm:8192:1"] = true
  L17_2["LDUrlMonInject64.exe:msedge.exe:remotethread:allocvmremote:1122:1"] = true
  L17_2["SIP.exe:HxTsr.exe:remotethread:protectvm:8192:1"] = true
  L17_2["explorer.exe:chrome.exe:remotethread:allocvmremote:664:1"] = true
  L17_2["SIP.exe:VSSVC.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:splunk-MonitorNoHandle.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:CefSharp.BrowserSubprocess.exe:remotethread:protectvm:8192:1"] = true
  L17_2["explorer.exe:cmd.exe:remotethread:allocvmremote:664:1"] = true
  L17_2["Workstation.exe:Workstation.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["SIP.exe:WMIC.exe:remotethread:protectvm:8192:1"] = true
  L17_2["A180AG.exe:AcroRd32.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["explorer.exe:msedge.exe:remotethread:allocvmremote:664:1"] = true
  L17_2["A180AG.exe:Teams.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["A180AG.exe:WmiPrvSE.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["SIP.exe:get_proxy.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:wa_3rd_party_host_32.exe:remotethread:protectvm:8192:1"] = true
  L17_2["TextServer.exe:T.exe:remotethread:allocvmremote:508:1"] = true
  L17_2["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:170:1"] = true
  L17_2["SIP.exe:wa_3rd_party_host_64.exe:remotethread:protectvm:8192:1"] = true
  L17_2["LDUrlMonInject64.exe:chrome.exe:remotethread:allocvmremote:1122:1"] = true
  L17_2["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:164:1"] = true
  L17_2["SIP.exe:chrome.exe:remotethread:protectvm:8192:1"] = true
  L17_2["idea64.exe:java.exe:remotethread:allocvmremote:136:1"] = true
  L17_2["syspin.exe:explorer.exe:remotethread:allocvmremote:38008:1"] = true
  L17_2["OfficeClickToRun.exe:WINWORD.EXE:queueuserapc:protectvm:1024:1"] = true
  L17_2["msiexec_monitor64.exe:msiexec.exe:remotethread:allocvmremote:172:1"] = true
  L17_2["HubCore.exe:wfshell.exe:remotethread:allocvmremote:166:0"] = true
  L17_2["rundll32.exe:powershell.exe:remotethread:protectvm:4096:1"] = true
  L17_2["core.exe:msedge.exe:remotethread:allocvmremote:578:1"] = true
  L17_2["RadeonSoftware.exe:QtWebEngineProcess.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["SIP.exe:HPWarrantyChecker.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:powershell.exe:remotethread:protectvm:8192:0"] = true
  L17_2["SIP.exe:updater.exe:remotethread:protectvm:8192:1"] = true
  L17_2["NHOSTSVC.EXE:winlogon.exe:remotethread:allocvmremote:227328:1"] = true
  L17_2["explorer.exe:SecurityHealthSystray.exe:remotethread:allocvmremote:664:1"] = true
  L17_2["SIP.exe:cscript.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:osqueryi.exe:remotethread:protectvm:8192:1"] = true
  L17_2["core.exe:msedge.exe:remotethread:allocvmremote:725:1"] = true
  L17_2["Dropbox.exe:Dropbox.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["MavInject32.exe:EXCEL.EXE:queueuserapc:protectvm:1024:1"] = true
  L17_2["SIP.exe:RunHidden.exe:remotethread:protectvm:8192:1"] = true
  L17_2["A180AG.exe:conhost.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:928:1"] = true
  L17_2["911 Location Manager.exe:911 Location Manager.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:allocvmremote:578:1"] = true
  L17_2["Acrobat.exe:Acrobat.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:16:0"] = true
  L17_2["AppVClient.exe:msedge.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:800:1"] = true
  L17_2["SIP.exe:vf_host.exe:remotethread:protectvm:8192:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:allocvmremote:725:1"] = true
  L17_2["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:1312:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["Acrobat.exe:Acrobat.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:912:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:protectvm:1056:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:allocvmremote:555:1"] = true
  L17_2["brave.exe:brave.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AppVClient.exe:explorer.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["Workstation.exe:Workstation.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["core.exe:chrome.exe:queueuserapc:allocvmremote:578:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:protectvm:848:1"] = true
  L17_2["opera.exe:opera.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["Spotify.exe:Spotify.exe:queueuserapc:protectvm:16:1"] = true
  L17_2["core.exe:dllhost.exe:queueuserapc:allocvmremote:725:1"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:protectvm:16:0"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:allocvmremote:4096:0"] = true
  L17_2["core.exe:dwm.exe:queueuserapc:protectvm:950:1"] = true
  L17_2["msedge.exe:msedge.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["svservice.exe:svchost.exe:queueuserapc:protectvm:578:1"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:720:1"] = true
  L17_2["core.exe:dwm.exe:queueuserapc:allocvmremote:725:1"] = true
  L17_2["Code.exe:Code.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AdskAccessUIHost.exe:AdskAccessUIHost.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["CTskMstr.exe:AgentExecutor.exe:queueuserapc:allocvmremote:612:1"] = true
  L17_2["svservice.exe:powershell.exe:queueuserapc:protectvm:578:1"] = true
  L17_2["AppVClient.exe:iexplore.exe:queueuserapc:protectvm:1024:1"] = true
  L17_2["cyserver.exe:tlaworker.exe:queueuserapc:protectvm:1:1"] = true
  L17_2["jabra-direct.exe:jabra-direct.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["core.exe:chrome.exe:queueuserapc:allocvmremote:725:1"] = true
  L17_2["rserver3.exe:FamItrfc.Exe:queueuserapc:allocvmremote:41:1"] = true
  L17_2["AcroRd32.exe:AcroRd32.exe:queueuserapc:protectvm:12:0"] = true
  L17_2["chrome.exe:chrome.exe:queueuserapc:protectvm:656:1"] = true
  L17_2["tableau.exe:QtWebEngineProcess.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["911 Location Manager.exe:911 Location Manager.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["EPOSConnect.exe:EPOSConnect.exe:queueuserapc:protectvm:12:1"] = true
  L17_2["SIP.exe:Textron.scr:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:BeforeLogonForm.exe:remotethread:protectvm:8192:1"] = true
  L17_2["SIP.exe:wscript.exe:remotethread:protectvm:8192:1"] = true
  L17_2["idea64.exe:java.exe:queueuserapc:allocvmremote:136:1"] = true
  L17_2["SIP.exe:TaniumExecWrapper.exe:remotethread:protectvm:8192:1"] = true
  L17_2["A180AG.exe:Cibc.DI.Platform.Process.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["A180AG.exe:chrome.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["MavInject32.exe:WINWORD.EXE:queueuserapc:protectvm:1024:1"] = true
  L17_2["SIP.exe:AdobeARM.exe:remotethread:protectvm:8192:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:protectvm:578:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:allocvmremote:950:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:protectvm:555:1"] = true
  L17_2["core.exe:firefox.exe:queueuserapc:allocvmremote:521:1"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:protectvm:725:1"] = true
  L17_2["Teams.exe:Teams.exe:queueuserapc:allocvmremote:4096:0"] = true
  L17_2["core.exe:msedge.exe:queueuserapc:protectvm:950:1"] = true
  L17_2["SIP.exe:DPM.exe:remotethread:protectvm:8192:1"] = true
  L17_2["A180AG.exe:chrome.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["AMAgentAssist.exe:winlogon.exe:remotethread:allocvmremote:138:1"] = true
  L17_2["core.exe:msedge.exe:remotethread:allocvmremote:555:1"] = true
  L17_2["explorer.exe:EXCEL.EXE:remotethread:allocvmremote:664:1"] = true
  L17_2["AMDllInjectionAssist.exe:vpnagent.exe:remotethread:allocvmremote:150:1"] = true
  L17_2["jcmd.exe:java.exe:queueuserapc:allocvmremote:136:1"] = true
  L17_2["SIP.exe:splunk-admon.exe:remotethread:protectvm:8192:1"] = true
  L17_2["msedge.exe:msedge.exe:remotethread:allocvmremote:4096:1"] = true
  L17_2["OfficeClickToRun.exe:POWERPNT.EXE:queueuserapc:protectvm:1024:1"] = true
  L17_2["AMAgentAssist.exe:lsass.exe:remotethread:allocvmremote:138:1"] = true
  L17_2["firefox.exe:firefox.exe:queueuserapc:mapview:65536:1"] = true
  L17_2["sfc.exe:msedge.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["explorer.exe:PGStub.exe:remotethread:allocvmremote:664:1"] = true
  L17_2["AMDllInjectionAssist.exe:armsvc.exe:remotethread:allocvmremote:150:1"] = true
  L17_2["EPOSConnect.exe:EPOSConnect.exe:queueuserapc:allocvmremote:4096:1"] = true
  L17_2["explorer.exe:SnippingTool.exe:remotethread:allocvmremote:664:1"] = true
  L18_2 = L17_2[L16_2]
  if L18_2 then
    L18_2 = false
    return L18_2
  end
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_al"
  L20_2 = L6_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_tp"
  L20_2 = L8_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_sz"
  L20_2 = L4_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_fr"
  L20_2 = L13_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_src_img"
  L20_2 = L14_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_tgt_img"
  L20_2 = L15_2
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = bm
  L18_2 = L18_2.add_related_string
  L19_2 = "ci_v"
  L20_2 = "2"
  L21_2 = bm
  L21_2 = L21_2.RelatedStringBMReport
  L18_2(L19_2, L20_2, L21_2)
  L18_2 = string
  L18_2 = L18_2.format
  L19_2 = "pid:%s,ProcessStart:%s"
  L20_2 = L9_2
  L21_2 = L10_2
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = TriggerTargetedMemoryScan
  L20_2 = L5_2
  L21_2 = L18_2
  L19_2(L20_2, L21_2)
  L19_2 = bm
  L19_2 = L19_2.trigger_sig
  L20_2 = "injection_target"
  L21_2 = "Behavior:Win32/ScanCodeInjection.A"
  L22_2 = L18_2
  L19_2(L20_2, L21_2, L22_2)
  L19_2 = true
  return L19_2
end

ProcessCodeInjection = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A2_2 == 0 then
    return
  end
  if A0_2 == nil or A0_2 == "" then
    return
  end
  L4_2 = A2_2
  if A2_2 == nil or A2_2 < 0 or 5 < A2_2 then
    L4_2 = 2
  end
  if A3_2 == nil or A3_2 == "" then
    A3_2 = true
  end
  if A3_2 then
    L5_2 = bm
    L5_2 = L5_2.get_imagepath
    L5_2 = L5_2()
    if L5_2 ~= nil and L5_2 ~= "" then
      L6_2 = isTainted
      L7_2 = L5_2
      L8_2 = A0_2
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L6_2 = bm
        L6_2 = L6_2.add_related_file
        L7_2 = L5_2
        L6_2(L7_2)
        L6_2 = true
        return L6_2
      end
    end
  end
  L5_2 = A1_2
  if A1_2 == nil or A1_2 == "" then
    L6_2 = bm
    L6_2 = L6_2.get_current_process_startup_info
    L6_2 = L6_2()
    if L6_2 ~= nil then
      L7_2 = L6_2.ppid
      if L7_2 ~= nil then
        L7_2 = L6_2.ppid
        if L7_2 ~= "" then
          goto lbl_60
        end
      end
    end
    do return end
    ::lbl_60::
    L5_2 = L6_2.ppid
  end
  L6_2 = mp
  L6_2 = L6_2.GetParentProcInfo
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if L6_2 ~= nil then
    L7_2 = L6_2.ppid
    if L7_2 ~= nil then
      L7_2 = L6_2.image_path
      if L7_2 ~= nil then
        L7_2 = isTainted
        L8_2 = L6_2.image_path
        L9_2 = A0_2
        L7_2 = L7_2(L8_2, L9_2)
        if L7_2 then
          L7_2 = bm
          L7_2 = L7_2.add_related_file
          L8_2 = L6_2.image_path
          L7_2(L8_2)
          L7_2 = true
          return L7_2
        end
        L7_2 = IsTaintedProcessinParentTreeForLinux
        L8_2 = A0_2
        L9_2 = L6_2.ppid
        L10_2 = L4_2 - 1
        L11_2 = false
        return L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
end

IsTaintedProcessinParentTreeForLinux = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = bm
  L3_2 = L3_2.GetPEBInfo
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = isnull
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.HostArch
  L5_2 = mp
  L5_2 = L5_2.SMS_PROC_ARCH_X64
  if L4_2 == L5_2 then
    L4_2 = L3_2.ProcArch
    L5_2 = mp
    L5_2 = L5_2.SMS_PROC_ARCH_X64
    if L4_2 == L5_2 then
      goto lbl_24
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_24::
  L4_2 = bm
  L4_2 = L4_2.ReadProcMem
  L5_2 = L3_2.PEBAddr
  L5_2 = L5_2 + 32
  L6_2 = 8
  L7_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 ~= nil then
    L5_2 = string
    L5_2 = L5_2.len
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 == 8 then
      goto lbl_41
    end
  end
  L5_2 = false
  do return L5_2 end
  ::lbl_41::
  L5_2 = mp
  L5_2 = L5_2.readu_u64
  L6_2 = L4_2
  L7_2 = 1
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = bm
  L6_2 = L6_2.ReadProcMem
  L7_2 = L5_2 + 96
  L8_2 = 16
  L9_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if L6_2 ~= nil then
    L7_2 = string
    L7_2 = L7_2.len
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == 16 then
      goto lbl_62
    end
  end
  L7_2 = false
  do return L7_2 end
  ::lbl_62::
  L7_2 = bm
  L7_2 = L7_2.ReadProcMem
  L8_2 = L5_2 + 112
  L9_2 = 16
  L10_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if L7_2 ~= nil then
    L8_2 = string
    L8_2 = L8_2.len
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 == 16 then
      goto lbl_78
    end
  end
  L8_2 = false
  do return L8_2 end
  ::lbl_78::
  L8_2 = mp
  L8_2 = L8_2.readu_u16
  L9_2 = L6_2
  L10_2 = 1
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = mp
  L9_2 = L9_2.readu_u16
  L10_2 = L7_2
  L11_2 = 1
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = mp
  L10_2 = L10_2.readu_u64
  L11_2 = L6_2
  L12_2 = 9
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = mp
  L11_2 = L11_2.readu_u64
  L12_2 = L7_2
  L13_2 = 9
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = bm
  L12_2 = L12_2.ReadProcMem
  L13_2 = L10_2
  L14_2 = L8_2
  L15_2 = A0_2
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  if L12_2 ~= nil then
    L13_2 = string
    L13_2 = L13_2.len
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    if L13_2 == L8_2 then
      goto lbl_114
    end
  end
  L13_2 = false
  do return L13_2 end
  ::lbl_114::
  L13_2 = normalize_unicode
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  L12_2 = L13_2
  L13_2 = isnull
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  if L13_2 then
    L13_2 = false
    return L13_2
  end
  L13_2 = bm
  L13_2 = L13_2.ReadProcMem
  L14_2 = L11_2
  L15_2 = L9_2
  L16_2 = A0_2
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  if L13_2 ~= nil then
    L14_2 = string
    L14_2 = L14_2.len
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    if L14_2 == L9_2 then
      goto lbl_141
    end
  end
  L14_2 = false
  do return L14_2 end
  ::lbl_141::
  L14_2 = normalize_unicode
  L15_2 = L13_2
  L14_2 = L14_2(L15_2)
  L13_2 = L14_2
  L14_2 = isnull
  L15_2 = L13_2
  L14_2 = L14_2(L15_2)
  if L14_2 then
    L14_2 = false
    return L14_2
  end
  L14_2 = string
  L14_2 = L14_2.lower
  L15_2 = A1_2
  L14_2 = L14_2(L15_2)
  A1_2 = L14_2
  L14_2 = string
  L14_2 = L14_2.lower
  L15_2 = L12_2
  L14_2 = L14_2(L15_2)
  L12_2 = L14_2
  if L13_2 ~= A2_2 or L12_2 ~= A1_2 then
    L14_2 = bm
    L14_2 = L14_2.add_related_string
    L15_2 = "PEB Spoofing Trace Commandline: "
    L16_2 = A2_2
    L17_2 = bm
    L17_2 = L17_2.RelatedStringBMReport
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = bm
    L14_2 = L14_2.add_related_string
    L15_2 = "PEB Spoofing PEB Commandline: "
    L16_2 = L13_2
    L17_2 = bm
    L17_2 = L17_2.RelatedStringBMReport
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = bm
    L14_2 = L14_2.add_related_string
    L15_2 = "PEB Spoofing Trace ImagePath: "
    L16_2 = A1_2
    L17_2 = bm
    L17_2 = L17_2.RelatedStringBMReport
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = bm
    L14_2 = L14_2.add_related_string
    L15_2 = "PEB Spoofing PEB ImagePath: "
    L16_2 = L12_2
    L17_2 = bm
    L17_2 = L17_2.RelatedStringBMReport
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = bm
    L14_2 = L14_2.add_related_process
    L15_2 = A0_2
    L14_2(L15_2)
    L14_2 = true
    return L14_2
  end
  L14_2 = false
  return L14_2
end

IsPEBSpoofed = L3_1

function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = versioning
  L0_2 = L0_2.GetOrgID
  L0_2 = L0_2()
  if L0_2 ~= nil and L0_2 ~= "" then
    L2_2 = L0_2
    L1_2 = L0_2.lower
    L1_2 = L1_2(L2_2)
    if L1_2 ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" then
      L2_2 = L0_2
      L1_2 = L0_2.lower
      L1_2 = L1_2(L2_2)
      if L1_2 ~= "24d4a9cf-e7f1-400a-b2d4-bd534e1e168d" then
        goto lbl_18
      end
    end
    L1_2 = true
    return L1_2
  end
  ::lbl_18::
  L1_2 = false
  return L1_2
end

verify_relevant_sim_orgs = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = {}
  L0_2["0dde20f2-5621-4cfa-b3f5-b920800dd3b4"] = true
  L0_2["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
  L0_2["bfbc94c5-06ed-4eb5-9a15-d6b60cc9794c"] = true
  L0_2["9f7a3318-62d2-47d1-bbff-8b380b669698"] = true
  L0_2["da82a2d8-0d12-41a6-b3dc-3b010c59f54a"] = true
  L0_2["395e414e-24a3-4802-82c4-e47dd3ffb449"] = true
  L0_2["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true
  L0_2["2c6bd823-96a3-4121-b933-3d4193c1d6be"] = true
  L0_2["281296cc-22c0-4a74-b110-c064d45023ef"] = true
  L0_2["74e1dfed-6804-4e3c-bce4-b4d7c66c9823"] = true
  L0_2["0c05a59a-e6b3-4702-ae89-50f170bea544"] = true
  L0_2["96b0e66b-fb6c-4997-a3e2-a6acf57b1c64"] = true
  L0_2["9e561f08-d9a6-425f-8bbd-386b32139c24"] = true
  L0_2["3720c38e-7037-4391-b44a-3024091a5954"] = true
  L0_2["789eac8d-f812-4fdf-8b65-037a639ce266"] = true
  L0_2["a5083083-0e16-4695-8dca-72a29a1a5372"] = true
  L0_2["27f2abe6-da2d-4e59-9456-09c5210dfc73"] = true
  L0_2["7ba9358d-e714-4eb8-8768-0d9b568d44c6"] = true
  L0_2["ede93498-0189-4b5a-bb7d-bdb374cbebd3"] = true
  L0_2["d45c2b71-83c3-48a3-baf6-0714155a2b53"] = true
  L0_2["aae7c2f9-7572-4de6-890f-627578b1c3c7"] = true
  L0_2["e66d8213-210c-42e8-9911-e3171f34a171"] = true
  L1_2 = versioning
  L1_2 = L1_2.GetOrgID
  L1_2 = L1_2()
  if not L1_2 or L1_2 == "" then
    L2_2 = false
    return L2_2
  end
  L3_2 = L1_2
  L2_2 = L1_2.lower
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  L2_2 = L0_2[L1_2]
  L2_2 = L2_2 == true
  return L2_2
end

verify_memory_features_coverage_orgs = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = {}
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_2
    L1_3 = L1_3[A0_3]
    if L1_3 ~= A0_3 then
      L1_3 = L0_2
      L2_3 = L1_2
      L3_3 = L0_2
      L3_3 = L3_3[A0_3]
      L2_3 = L2_3(L3_3)
      L1_3[A0_3] = L2_3
    end
    L1_3 = L0_2
    L1_3 = L1_3[A0_3]
    return L1_3
  end
  
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = L0_2
    L2_3 = L0_2
    L2_3 = L2_3[A0_3]
    if not L2_3 then
      L2_3 = A0_3
    end
    L1_3[A0_3] = L2_3
  end
  
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L2_2
    L3_3 = A0_3
    L2_3(L3_3)
    L2_3 = L2_2
    L3_3 = A1_3
    L2_3(L3_3)
    L2_3 = L1_2
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = L1_2
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    if L2_3 ~= L3_3 then
      L4_3 = L0_2
      L4_3[L3_3] = L2_3
    end
  end
  
  L4_2 = {}
  L4_2.find = L1_2
  L4_2.union = L3_2
  L4_2.ensure = L2_2
  return L4_2
end

make_uf = L3_1

function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not (L3_2 and L4_2) or not L5_2 then
    L6_2 = false
    return L6_2
  end
  
  function L6_2(A0_3)
    local L1_3
    L1_3 = A0_3 == 0 or A0_3 == 1 or A0_3 == 2
    return L1_3
  end
  
  L7_2 = nil
  L8_2 = L6_2
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L7_2 = L3_2
  else
    L8_2 = L6_2
    L9_2 = L4_2
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L7_2 = L4_2
    else
      L8_2 = L6_2
      L9_2 = L5_2
      L8_2 = L8_2(L9_2)
      if not L8_2 then
        L7_2 = L5_2
      else
        L8_2 = false
        return L8_2
      end
    end
  end
  L8_2 = make_uf
  L8_2 = L8_2()
  L9_2 = ipairs
  L10_2 = {}
  L11_2 = 0
  L12_2 = 1
  L13_2 = 2
  L14_2 = L7_2
  L15_2 = L3_2
  L16_2 = L4_2
  L17_2 = L5_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L10_2[7] = L17_2
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  for L12_2, L13_2 in L9_2, L10_2, L11_2 do
    L14_2 = L8_2.ensure
    L15_2 = L13_2
    L14_2(L15_2)
  end
  L9_2 = L8_2.union
  L10_2 = L3_2
  L11_2 = 0
  L9_2(L10_2, L11_2)
  L9_2 = L8_2.union
  L10_2 = L4_2
  L11_2 = 1
  L9_2(L10_2, L11_2)
  L9_2 = L8_2.union
  L10_2 = L5_2
  L11_2 = 2
  L9_2(L10_2, L11_2)
  L9_2 = L8_2.find
  L10_2 = L7_2
  L9_2 = L9_2(L10_2)
  L10_2 = L8_2.find
  L11_2 = 0
  L10_2 = L10_2(L11_2)
  L10_2 = L10_2 == L9_2
  return L10_2
end

verify_socket_fd_triplet = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L2_2 or not L3_2 then
    L4_2 = false
    return L4_2
  end
  
  function L4_2(A0_3)
    local L1_3
    L1_3 = A0_3 == 0 or A0_3 == 1
    return L1_3
  end
  
  L5_2 = nil
  L6_2 = L4_2
  L7_2 = L2_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L5_2 = L2_2
  else
    L6_2 = L4_2
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L5_2 = L3_2
    else
      L6_2 = false
      return L6_2
    end
  end
  L6_2 = make_uf
  L6_2 = L6_2()
  L7_2 = ipairs
  L8_2 = {}
  L9_2 = 0
  L10_2 = 1
  L11_2 = L5_2
  L12_2 = L2_2
  L13_2 = L3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = L6_2.ensure
    L13_2 = L11_2
    L12_2(L13_2)
  end
  L7_2 = L6_2.union
  L8_2 = L2_2
  L9_2 = 0
  L7_2(L8_2, L9_2)
  L7_2 = L6_2.union
  L8_2 = L3_2
  L9_2 = 1
  L7_2(L8_2, L9_2)
  L7_2 = L6_2.find
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L8_2 = L6_2.find
  L9_2 = 0
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2 == L7_2
  return L8_2
end

verify_socket_fd_pair = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = true
    return L1_2
  end
  L1_2 = {}
  L2_2 = "/usr/"
  L3_2 = "/var/lib/"
  L4_2 = "/bin/"
  L5_2 = "/var/log/"
  L6_2 = "/var/opt/"
  L7_2 = "/opt/"
  L8_2 = "/etc/"
  L9_2 = "/snap/"
  L10_2 = "/proc/"
  L11_2 = "/sbin/"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L8_2 = A0_2
    L7_2 = A0_2.sub
    L9_2 = 1
    L10_2 = #L6_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 == L6_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = {}
  L3_2 = "/ansible"
  L4_2 = "/snap/"
  L5_2 = "/splunkd/"
  L6_2 = "/oracle/"
  L7_2 = "-salt-"
  L8_2 = "/tmp/go-build"
  L9_2 = "/var/intel"
  L10_2 = "/var/cache"
  L11_2 = "/var/arcticwolfnetworks"
  L12_2 = "/jenkins"
  L13_2 = "/filebeat"
  L14_2 = ".kubectl"
  L15_2 = "clamav-"
  L16_2 = ".tivoli"
  L17_2 = "containerd-shim"
  L18_2 = "docker-"
  L19_2 = "influx_"
  L20_2 = "influxd"
  L21_2 = "terraform-"
  L22_2 = "zscaler-"
  L23_2 = "/tmp/apt-key-gpg"
  L24_2 = "common-setup-and-utils-script.sh"
  L25_2 = "mdatp-edr-mitre-setup.sh"
  L26_2 = "mdatp-epp-mitre-setup.sh"
  L27_2 = "amazon-ssm-agent"
  L28_2 = "/python"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L2_2[9] = L11_2
  L2_2[10] = L12_2
  L2_2[11] = L13_2
  L2_2[12] = L14_2
  L2_2[13] = L15_2
  L2_2[14] = L16_2
  L2_2[15] = L17_2
  L2_2[16] = L18_2
  L2_2[17] = L19_2
  L2_2[18] = L20_2
  L2_2[19] = L21_2
  L2_2[20] = L22_2
  L2_2[21] = L23_2
  L2_2[22] = L24_2
  L2_2[23] = L25_2
  L2_2[24] = L26_2
  L2_2[25] = L27_2
  L2_2[26] = L28_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = {}
  L4_2 = "/bash"
  L5_2 = "/zsh"
  L6_2 = "/sh"
  L7_2 = "/csh"
  L8_2 = "/dash"
  L9_2 = "/ksh93"
  L10_2 = "/ksh"
  L11_2 = "/tcsh"
  L12_2 = "/perl"
  L13_2 = "/ruby"
  L14_2 = "/java"
  L15_2 = "/openssl"
  L16_2 = "/gpg"
  L17_2 = "/dd"
  L18_2 = "/shred"
  L19_2 = "/rm"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L3_2[12] = L15_2
  L3_2[13] = L16_2
  L3_2[14] = L17_2
  L3_2[15] = L18_2
  L3_2[16] = L19_2
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L10_2 = A0_2
    L9_2 = A0_2.sub
    L11_2 = #L8_2
    L11_2 = -1 * L11_2
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 == L8_2 then
      L9_2 = true
      return L9_2
    end
  end
  L4_2 = false
  return L4_2
end

check_common_process_linux = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2.matched
  if L2_2 then
    L2_2 = A0_2.utf8p1
    if L2_2 ~= nil then
      L2_2 = string
      L2_2 = L2_2.match
      L3_2 = A0_2.utf8p1
      L4_2 = "Socket:(%d+)"
      L2_2 = L2_2(L3_2, L4_2)
      L1_2 = L2_2
    end
  end
  return L1_2
end

get_socket_fd_from_dup_event = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "table" then
    L2_2 = isnull
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = type
      L3_2 = A1_2
      L2_2 = L2_2(L3_2)
      if L2_2 == "string" then
        L2_2 = isnull
        L3_2 = A1_2
        L2_2 = L2_2(L3_2)
        if not L2_2 then
          L2_2 = mp
          L2_2 = L2_2.SIGATTR_LOG_SZ
          if L2_2 ~= 0 then
            goto lbl_28
          end
        end
      end
    end
  end
  L2_2 = 0
  L3_2 = nil
  do return L2_2, L3_2 end
  ::lbl_28::
  L2_2 = 16505
  L3_2 = {}
  L4_2 = 0
  L5_2 = pairs
  L6_2 = A0_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L3_2[L9_2] = 0
  end
  L5_2 = mp
  L5_2 = L5_2.SIGATTR_LOG_SZ
  L6_2 = 1
  L7_2 = -1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = sigattr_tail
    L9_2 = L9_2[L8_2]
    L10_2 = isnull
    L11_2 = L9_2.attribute
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      L10_2 = isnull
      L11_2 = L9_2.utf8p1
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        L10_2 = isnull
        L11_2 = L9_2.utf8p2
        L10_2 = L10_2(L11_2)
        if not L10_2 then
          L10_2 = L9_2.attribute
          if L10_2 == L2_2 then
            L10_2 = L9_2.utf8p2
            if L10_2 == A1_2 then
              L10_2 = L9_2.utf8p1
              L10_2 = L3_2[L10_2]
              if L10_2 ~= nil then
                L10_2 = L9_2.utf8p1
                L11_2 = L9_2.utf8p1
                L11_2 = L3_2[L11_2]
                L11_2 = L11_2 + 1
                L3_2[L10_2] = L11_2
                L4_2 = L4_2 + 1
              end
            end
          end
        end
      end
    end
  end
  L5_2 = L4_2
  L6_2 = L3_2
  return L5_2, L6_2
end

find_nearby_protectvmlocal_changes = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L4_2 = 10000000
  L5_2 = 16402
  L6_2 = isnull
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = mp
    L6_2 = L6_2.SIGATTR_LOG_SZ
    if L6_2 ~= 0 then
      goto lbl_15
    end
  end
  L6_2 = 0
  L7_2 = nil
  do return L6_2, L7_2 end
  ::lbl_15::
  L6_2 = isnull
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    A1_2 = 3
  end
  L6_2 = isnull
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    A2_2 = 30
  end
  L6_2 = isnull
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    A3_2 = true
  end
  A2_2 = A2_2 * L4_2
  L6_2 = bm
  L6_2 = L6_2.GetOverallTrafficVolumes
  L6_2 = L6_2()
  L7_2 = isnull
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = isnull
    L8_2 = L6_2.first_report_time
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = isnull
      L8_2 = L6_2.last_report_time
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        goto lbl_55
      end
    end
  end
  L7_2 = 0
  L8_2 = nil
  do return L7_2, L8_2 end
  ::lbl_55::
  L7_2 = L6_2.first_report_time
  L7_2 = L7_2 - A2_2
  L8_2 = L6_2.last_report_time
  L8_2 = L8_2 + A2_2
  if A0_2 < L7_2 or A0_2 > L8_2 then
    L9_2 = 0
    L10_2 = nil
    return L9_2, L10_2
  end
  L9_2 = {}
  L10_2 = mp
  L10_2 = L10_2.SIGATTR_LOG_SZ
  L11_2 = 1
  L12_2 = -1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = sigattr_tail
    L14_2 = L14_2[L13_2]
    L15_2 = isnull
    L16_2 = L14_2.attribute
    L15_2 = L15_2(L16_2)
    if not L15_2 then
      L15_2 = isnull
      L16_2 = L14_2.utf8p1
      L15_2 = L15_2(L16_2)
      if not L15_2 then
        L15_2 = isnull
        L16_2 = L14_2.utf8p2
        L15_2 = L15_2(L16_2)
        if not L15_2 then
          L15_2 = L14_2.attribute
          if L15_2 == L5_2 then
            L15_2 = L14_2.utf8p1
            if L15_2 ~= "NRI:HasRequestResponse.A" then
              L15_2 = L14_2.utf8p1
              if L15_2 ~= "NRI:OutgoingRemoteConnection" then
                goto lbl_230
              end
            end
            L15_2 = nil
            L16_2 = nil
            L17_2 = nil
            L18_2 = nil
            L19_2 = nil
            L20_2 = L14_2.utf8p1
            if L20_2 == "NRI:OutgoingRemoteConnection" then
              L19_2 = "req"
            else
              L19_2 = "resp"
            end
            L20_2 = string
            L20_2 = L20_2.match
            L21_2 = L14_2.utf8p2
            L22_2 = ";DestIp=(.-);DestPort=([0-9]+);.-;Uri=(.-);"
            L20_2, L21_2, L22_2 = L20_2(L21_2, L22_2)
            L17_2 = L22_2
            L16_2 = L21_2
            L15_2 = L20_2
            if L17_2 ~= "" then
              L20_2 = string
              L20_2 = L20_2.match
              L21_2 = string
              L21_2 = L21_2.gsub
              L22_2 = L17_2
              L23_2 = "^https?://"
              L24_2 = ""
              L21_2 = L21_2(L22_2, L23_2, L24_2)
              L22_2 = "^([^/]-)"
              L20_2 = L20_2(L21_2, L22_2)
              L18_2 = L20_2
            end
            L20_2 = isnull
            L21_2 = L18_2
            L20_2 = L20_2(L21_2)
            if L20_2 then
              L18_2 = ""
            else
              L20_2 = string
              L20_2 = L20_2.lower
              L21_2 = L18_2
              L20_2 = L20_2(L21_2)
              L18_2 = L20_2
            end
            L20_2 = isnull
            L21_2 = L15_2
            L20_2 = L20_2(L21_2)
            if not L20_2 then
              L20_2 = isnull
              L21_2 = L16_2
              L20_2 = L20_2(L21_2)
              if not L20_2 then
                if L17_2 ~= "" then
                  L20_2 = string
                  L20_2 = L20_2.find
                  L21_2 = L18_2
                  L22_2 = "."
                  L23_2 = 1
                  L24_2 = true
                  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
                end
                if L20_2 and L18_2 ~= "aadcdn.msftauth.net" and L18_2 ~= "detectportal.firefox.com" and L18_2 ~= "loki.delve.office.com" and L18_2 ~= "ocsp.digicert.com" and L18_2 ~= "odc.officeapps.live.com" and L18_2 ~= "outlook.office365.com" then
                  L20_2 = string
                  L20_2 = L20_2.find
                  L21_2 = L18_2
                  L22_2 = "crl[0-9]%.digicert%.com"
                  L20_2 = L20_2(L21_2, L22_2)
                  if not L20_2 then
                    L20_2 = string
                    L20_2 = L20_2.format
                    L21_2 = "%s:%s"
                    L22_2 = L15_2
                    L23_2 = L16_2
                    L20_2 = L20_2(L21_2, L22_2, L23_2)
                    L21_2 = getIpAddressClass
                    L22_2 = L15_2
                    L21_2 = L21_2(L22_2)
                    if A3_2 then
                      L22_2 = isnull
                      L23_2 = L21_2
                      L22_2 = L22_2(L23_2)
                      if L22_2 or L21_2 ~= 3 and L21_2 ~= 8 then
                        goto lbl_230
                      end
                      L22_2 = string
                      L22_2 = L22_2.find
                      L23_2 = L15_2
                      L24_2 = "^fe80::"
                      L22_2 = L22_2(L23_2, L24_2)
                      if L22_2 then
                        goto lbl_230
                      end
                    end
                    L22_2 = L9_2[L20_2]
                    if L22_2 == nil then
                      L22_2 = {}
                      L22_2.req = 0
                      L22_2.resp = 0
                      L23_2 = {}
                      L22_2.uri = L23_2
                      L9_2[L20_2] = L22_2
                    end
                    L22_2 = L9_2[L20_2]
                    L23_2 = L9_2[L20_2]
                    L23_2 = L23_2[L19_2]
                    L23_2 = L23_2 + 1
                    L22_2[L19_2] = L23_2
                    L22_2 = isnull
                    L23_2 = L17_2
                    L22_2 = L22_2(L23_2)
                    if not L22_2 then
                      L22_2 = table
                      L22_2 = L22_2.insert
                      L23_2 = L9_2[L20_2]
                      L23_2 = L23_2.uri
                      L24_2 = L17_2
                      L22_2(L23_2, L24_2)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    ::lbl_230::
  end
  L10_2 = 0
  L11_2 = {}
  L12_2 = pairs
  L13_2 = L9_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = math_min
    L18_2 = L16_2.req
    L19_2 = L16_2.resp
    L17_2 = L17_2(L18_2, L19_2)
    if A1_2 <= L17_2 then
      L18_2 = {}
      L18_2.count = L17_2
      L19_2 = L16_2.uri
      L18_2.uri = L19_2
      L11_2[L15_2] = L18_2
      L10_2 = L10_2 + 1
    end
  end
  L12_2 = L10_2
  L13_2 = L11_2
  return L12_2, L13_2
end

find_nearby_suspicious_traffic = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = {}
  L1_2 = bm
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = ""
  L2_2 = ""
  L3_2 = mp
  L3_2 = L3_2.SIGATTR_LOG_SZ
  L4_2 = 1
  L5_2 = -1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = sigattr_head
    L7_2 = L7_2[L6_2]
    L7_2 = L7_2.attribute
    if L7_2 then
      L7_2 = sigattr_head
      L7_2 = L7_2[L6_2]
      L7_2 = L7_2.attribute
      if L7_2 ~= 16404 then
        L7_2 = sigattr_head
        L7_2 = L7_2[L6_2]
        L7_2 = L7_2.attribute
        if L7_2 ~= 61440 then
          L7_2 = sigattr_head
          L7_2 = L7_2[L6_2]
          L7_2 = L7_2.utf8p1
          if L7_2 then
            L7_2 = sigattr_head
            L7_2 = L7_2[L6_2]
            L1_2 = L7_2.utf8p1
          end
          L7_2 = sigattr_head
          L7_2 = L7_2[L6_2]
          L7_2 = L7_2.utf8p2
          if L7_2 then
            L7_2 = sigattr_head
            L7_2 = L7_2[L6_2]
            L2_2 = L7_2.utf8p2
          end
          L7_2 = {}
          L8_2 = sigattr_head
          L8_2 = L8_2[L6_2]
          L8_2 = L8_2.attribute
          L7_2.event_attribute = L8_2
          L7_2.utf8p1 = L1_2
          L7_2.utf8p2 = L2_2
          L8_2 = table
          L8_2 = L8_2.insert
          L9_2 = L0_2
          L10_2 = L7_2
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
  L3_2 = table_split_chunks
  L4_2 = L0_2
  L5_2 = 100
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    L9_2 = safeJsonSerialize
    L10_2 = L8_2
    L11_2 = 260
    L9_2 = L9_2(L10_2, L11_2)
    if L8_2 and L9_2 and L7_2 then
      L10_2 = bm
      L10_2 = L10_2.add_related_string
      L11_2 = "reportBmInfo_"
      L12_2 = L7_2
      L11_2 = L11_2 .. L12_2
      L12_2 = L9_2
      L13_2 = bm
      L13_2 = L13_2.RelatedStringBMReport
      L10_2(L11_2, L12_2, L13_2)
      L10_2 = bm
      L10_2 = L10_2.add_related_string
      L11_2 = "reportBmInfo_"
      L12_2 = L7_2
      L13_2 = "_content_size"
      L11_2 = L11_2 .. L12_2 .. L13_2
      L12_2 = tostring
      L13_2 = #L9_2
      L12_2 = L12_2(L13_2)
      L13_2 = bm
      L13_2 = L13_2.RelatedStringBMReport
      L10_2(L11_2, L12_2, L13_2)
    end
  end
  L4_2 = bm
  L4_2 = L4_2.add_related_string
  L5_2 = "reportBmInfo_size"
  L6_2 = tostring
  L7_2 = #L0_2
  L6_2 = L6_2(L7_2)
  L7_2 = bm
  L7_2 = L7_2.RelatedStringBMReport
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = true
  return L4_2
end

reportBmInfo = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = bm
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = 0
  L3_2 = mp
  L3_2 = L3_2.SIGATTR_LOG_SZ
  L4_2 = 1
  L5_2 = -1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = ""
    L8_2 = ""
    L9_2 = sigattr_head
    L9_2 = L9_2[L6_2]
    L9_2 = L9_2.attribute
    if L9_2 then
      L9_2 = sigattr_head
      L9_2 = L9_2[L6_2]
      L9_2 = L9_2.attribute
      if L9_2 ~= 16404 then
        L9_2 = sigattr_head
        L9_2 = L9_2[L6_2]
        L9_2 = L9_2.attribute
        if L9_2 ~= 61440 then
          L9_2 = sigattr_head
          L9_2 = L9_2[L6_2]
          L9_2 = L9_2.utf8p1
          if L9_2 then
            L9_2 = sigattr_head
            L9_2 = L9_2[L6_2]
            L7_2 = L9_2.utf8p1
          else
            L7_2 = "<empty>"
          end
          L9_2 = sigattr_head
          L9_2 = L9_2[L6_2]
          L9_2 = L9_2.utf8p2
          if L9_2 then
            L9_2 = sigattr_head
            L9_2 = L9_2[L6_2]
            L8_2 = L9_2.utf8p2
          else
            L8_2 = "<empty>"
          end
          L9_2 = {}
          L10_2 = sigattr_head
          L10_2 = L10_2[L6_2]
          L10_2 = L10_2.attribute
          L9_2.event_attribute = L10_2
          L9_2.utf8p1 = L7_2
          L9_2.utf8p2 = L8_2
          L10_2 = table
          L10_2 = L10_2.insert
          L11_2 = L1_2
          L12_2 = L9_2
          L10_2(L11_2, L12_2)
          L2_2 = L2_2 + 1
          if 128 < L2_2 then
            break
          end
        end
      end
    end
  end
  L3_2 = safeJsonSerialize
  L4_2 = L1_2
  L5_2 = 260
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = "127.0.0.1"
  if A0_2 ~= nil then
    L5_2 = A0_2.ip
    if L5_2 ~= nil then
      L4_2 = A0_2.ip
    end
  end
  L5_2 = SafeGetUrlReputation
  L6_2 = {}
  L7_2 = L4_2
  L6_2[1] = L7_2
  L7_2 = {}
  L7_2.SIG_CONTEXT = "BM"
  L7_2.CONTEXT_SOURCE = "GenRansomBmInfo3"
  L7_2.TAG = "NOLOOKUP"
  L7_2.data = L3_2
  L8_2 = false
  L9_2 = 3000
  L10_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if L5_2 then
    L6_2 = L5_2.error
    if L6_2 == 3 then
      L6_2 = SafeGetUrlReputation
      L7_2 = {}
      L8_2 = L4_2
      L7_2[1] = L8_2
      L8_2 = {}
      L8_2.SIG_CONTEXT = "BM"
      L8_2.CONTEXT_SOURCE = "GenRansomBmInfo3"
      L8_2.TAG = "NOLOOKUP"
      L8_2.data = L3_2
      L9_2 = false
      L10_2 = 3000
      L11_2 = false
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L5_2 = L6_2
    end
  end
  L6_2 = true
  return L6_2
end

reportBmInfoUrlRep = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = isnull
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "string" then
      goto lbl_14
    end
  end
  L1_2 = 0
  L2_2 = nil
  do return L1_2, L2_2 end
  ::lbl_14::
  L1_2 = 0
  L2_2 = {}
  L3_2 = ""
  L4_2 = {}
  L4_2[" "] = true
  L4_2["\n"] = true
  L4_2["\t"] = true
  L5_2 = false
  L6_2 = false
  L8_2 = A0_2
  L7_2 = A0_2.gmatch
  L9_2 = "."
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
  for L10_2 in L7_2, L8_2, L9_2 do
    if L5_2 then
      L11_2 = L3_2
      L12_2 = L10_2
      L3_2 = L11_2 .. L12_2
      L5_2 = false
    elseif L10_2 == "\\" and not L6_2 then
      L5_2 = true
    elseif L10_2 == "\"" then
      L6_2 = not L6_2
    else
      if not L6_2 then
        L11_2 = L4_2[L10_2]
        if L11_2 then
          L11_2 = #L3_2
          if 0 < L11_2 then
            L1_2 = L1_2 + 1
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L2_2
            L13_2 = L3_2
            L11_2(L12_2, L13_2)
          end
          L3_2 = ""
      end
      else
        L11_2 = L3_2
        L12_2 = L10_2
        L3_2 = L11_2 .. L12_2
      end
    end
  end
  if L5_2 or L6_2 then
    L7_2 = 0
    L8_2 = nil
    return L7_2, L8_2
  end
  L7_2 = #L3_2
  if 0 < L7_2 then
    L1_2 = L1_2 + 1
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L3_2
    L7_2(L8_2, L9_2)
  end
  L7_2 = L1_2
  L8_2 = L2_2
  return L7_2, L8_2
end

commandline_to_argv = L3_1

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = isnull
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = "TamperAMSI"
    A1_2 = L2_2 or A1_2
    if not L2_2 then
    end
  end
  L2_2 = isnull
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = not L2_2
  L2_2 = L2_2 == true
  L3_2 = nil
  L4_2 = nil
  if L2_2 then
    L5_2 = isnull
    L6_2 = A0_2.utf8p1
    L5_2 = L5_2(L6_2)
    if L5_2 then
      return
    end
  end
  L5_2 = bm
  L5_2 = L5_2.get_current_process_startup_info
  L5_2 = L5_2()
  L6_2 = isnull
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = isnull
    L7_2 = L5_2.ppid
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = string
      L6_2 = L6_2.find
      L7_2 = string
      L7_2 = L7_2.lower
      L8_2 = L5_2.command_line
      if not L8_2 then
        L8_2 = ""
      end
      L7_2 = L7_2(L8_2)
      L8_2 = "svchost.exe -k camera -s frameserver"
      L9_2 = 1
      L10_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if not L6_2 then
        goto lbl_61
      end
    end
  end
  do return end
  ::lbl_61::
  if L2_2 then
    L6_2 = string
    L6_2 = L6_2.match
    L7_2 = A0_2.utf8p1
    L8_2 = "imagename:(.+);targetprocessppid:(%d+):(%d+)$"
    L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
    L9_2 = isnull
    L10_2 = L6_2
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L9_2 = isnull
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = isnull
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if not L9_2 then
          goto lbl_84
        end
      end
    end
    do return end
    ::lbl_84::
    L9_2 = L6_2
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = "pid:%d,ProcessStart:%d"
    L12_2 = L7_2
    L13_2 = L8_2
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L4_2 = L10_2
    L3_2 = L9_2
  else
    L6_2 = L5_2.ppid
    L7_2 = GetFileName
    L8_2 = bm
    L8_2 = L8_2.get_imagepath
    L8_2 = L8_2()
    if not L8_2 then
      L8_2 = ""
    end
    L7_2 = L7_2(L8_2)
    L3_2 = L7_2
    L4_2 = L6_2
    L6_2 = isnull
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      return
    end
  end
  L6_2 = L3_2
  L7_2 = L4_2
  L8_2 = L2_2
  return L6_2, L7_2, L8_2
end

helper_tamperapi_setup = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2)
  local L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2
  L10_2 = isnull
  L11_2 = A3_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = "amsi.dll"
    A3_2 = L10_2 or A3_2
    if not L10_2 then
    end
  end
  L10_2 = isnull
  L11_2 = A4_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = {}
    L10_2.BadInstruction = true
    L10_2.KnownBad = true
    A4_2 = L10_2 or A4_2
    if not L10_2 then
    end
  end
  L10_2 = isnull
  L11_2 = A5_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = {}
    L11_2 = "AmsiScanBuffer"
    L10_2[1] = L11_2
    A5_2 = L10_2 or A5_2
    if not L10_2 then
    end
  end
  L10_2 = isnull
  L11_2 = A6_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = {}
    L10_2[144] = true
    L10_2[195] = true
    L10_2[196] = true
    L10_2[49] = true
    L10_2[51] = true
    A6_2 = L10_2 or A6_2
    if not L10_2 then
    end
  end
  L10_2 = isnull
  L11_2 = A7_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = type
    L11_2 = A7_2
    L10_2 = L10_2(L11_2)
    if L10_2 == "number" then
      goto lbl_55
    end
  end
  L10_2 = 20
  A7_2 = L10_2 or A7_2
  if not L10_2 then
  end
  ::lbl_55::
  L10_2 = isnull
  L11_2 = A8_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = "TamperAMSIPatch"
    A8_2 = L10_2 or A8_2
    if not L10_2 then
    end
  end
  L10_2 = isnull
  L11_2 = A9_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = "T1562.006"
    A9_2 = L10_2 or A9_2
    if not L10_2 then
    end
  end
  L10_2 = nil
  L11_2 = nil
  L12_2 = nil
  L13_2 = nil
  L14_2 = nil
  L15_2 = nil
  L16_2 = nil
  L17_2 = nil
  L18_2 = 300
  L19_2 = 86400
  L20_2 = string
  L20_2 = L20_2.format
  L21_2 = "%s_Metadata"
  L22_2 = A8_2
  L20_2 = L20_2(L21_2, L22_2)
  L21_2 = string
  L21_2 = L21_2.format
  L22_2 = "%s_Debug"
  L23_2 = A8_2
  L21_2 = L21_2(L22_2, L23_2)
  L22_2 = 0
  L23_2 = nil
  L24_2 = nil
  L25_2 = nil
  if A2_2 then
    L26_2 = "Remote"
    if L26_2 then
      goto lbl_92
    end
  end
  L26_2 = "Local"
  ::lbl_92::
  L27_2 = {}
  L27_2.AmsiOpenSession = "^4885D274474885C974428139414D5349753A488379080074334883791000742C41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3CCB857000780C3"
  L27_2.AmsiScanBuffer = "^4C8BDC49895B0849896B104989731857415641574883EC704D8BF9418BF848.-B8570007804C8D5C2470498B5B20498B6B28498B7330498BE3415F415E5FC3CC"
  L27_2.AmsiScanString = "^4883EC384533DB4885D2743D4C8B5424604D85D274334883C8FF48FFC06644391C4275F64803C041BBFFFFFFFF493BC377174C895424284C894C24204D8BC8448BC0E8"
  L27_2.DllGetClassObject = "^558BEC8B550833C956BE........8B048A3B048E75134183F90475F28B55108B4D0CE8"
  L27_2.EtwEventWrite = "^4C8BDC4883EC584D894BE833C0458943E04533C9498943D84533C0498943D06689442420E8........4883C458C3"
  L27_2.EventWrite = "^6E74646C6C2E4574774576656E745772697465004576656E745772697465456E645363656E6172696F006E74646C6C2E4574774576656E745772697465456E645363656E6172696F004576656E7457726974654578006E74646C6C2E4574774576656E7457726974654578004576656E74577269746553746172745363656E6172696F006E74646C6C2E4574774576656E74577269746553746172745363656E6172696F004576656E745772697465537472696E67006E74646C6C2E4574774576656E745772697465537472696E67004576656E7457726974655472616E73666572006E74646C6C2E4574774576656E7457726974655472616E736665720046696C65456E6372797074696F6E537461747573410046696C65456E6372797074696F6E537461747573570046"
  L27_2.LdrLoadDll = "^68........C3"
  L27_2.NtTraceEvent = "^4C8BD1B85E000000F604250803FE7F0175030F05C3CD2EC3"
  L28_2 = {}
  L28_2.AmsiOpenSession2 = "^4885D2743F4885C9743A488379080074334883791000742C41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3CCB857000780C3"
  L28_2.AmsiOpenSession3 = "^4885D2740C4885C9740748837908007507B857000780C3CC488379100074F241B801000000418BC0F00FC141184103C04898488902740433C0C3CC418BC0F00FC141184103C04898488902EBEACCCCCCCCCCCCCCE937060000CCCCCCCCCCCCCC488B4910488B01488B4020E910550000CCCCCCCCCCCCCCCC40534883EC20488BD9E822000000488BCB48FF15307600000F1F440000488BC34883C4205BC3CCCCCCCCCCCCCCCCCCCC488BC1488D15766600004883C108488910C701010000C0E98CEEFFFFCCCCCCCCCCCCCCCCCCCCCCCC488BC44889580848896810488970184889782041564883EC404D8BF1418BF8488BF2488BD9488B0DBCD40000488D05B5"
  L28_2.AmsiOpenSession4 = "^4885D274464885C974418139414D53497539488379080074324883791000742B41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3B857000780C3"
  L28_2.AmsiOpenSession5 = "^8BFF558BEC8B4D0C85C974398B450885C074328138414D5349752A83780400742483780800741E33D256428D700C8BC2F00FC1064089017507F00FC11642891133C05EEB05B8570007805DC20800CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8BFF558BEC8B4508568B48088B450C99528B3150518B4E10FF150012E26BFF56105E5DC20800CCCCCCCCCCCCCCCCCCCCE91B60DCF683EC185356A10000E26B8B5D108B75083D0000E26B741CF6401C047416FF751CFF751853FF750C56FF7014FF7010E805F9FFFF8B450C85C0745A85DB7456837D1C00745085F6744C813E414D534975448B560485D2743D8B4E0885C974368945EC8B451489"
  L28_2.AmsiScanString2 = "^8BFF558BEC8B550C85D27434837D1800742E8BCA568D7102668B0183C1026685C075F5FF75182BCEFF7514D1F9FF75108D04095052FF7508E813FFFFFF5EEB05B8570007805DC21400CCCCCCCCCCCCCC8BFF558BEC83E4F851535657A10000E26BBB0000E26B8B7508BF442EE16B3BC3741CF6401C04741656FF70148BD7FF70106A1959E8DEF6FFFFA10000E26B85F675243BC37416F6401C017410FF70148BD7FF70106A1A59E89DF6FFFFB857000780E9590100006A10FF150830E26B8BF08974240C85F67529A10000E26B3BC37416F6401C017410FF70148BD7FF70106A1B59E862F6FFFFB80E000780E91E01000033C08BFE68D022E16B"
  L28_2.AmsiScanString3 = "^4883EC384D8BD84533C04885D274264C8B5424604D85D2741C4883C8FF48FFC0664439044275F64C8D0400B8FFFFFFFF4C3BC0760BB8570007804883C438C3CC4C895424284C894C24204D8BCBE80E000000EBE6"
  L28_2.EtwEventWrite2 = "^405557415441564157488D6C24804881EC80010000488B05%x%x%x%x%x%x%x%x4833C4488945600F57C90F57C033C033FF488945C0458BF8488945504D8BE14C8BF24C8BD1448BC70F114424500F114424600F114424700F1145800F1145900F1145A00F1145B00F114DD00F114DE00F114DF00F114D000F114D100F114D200F114D300F114D404885D20F84220200000F10028BCF418BD248D1EA418BC2C1E80483E20748899C2478010000488D1D%x%x%x%x%x%x%x%x0F11442478458BCA4C8B9CD390%x21C003B8493%x%x%x%x19008BC70F92C14D85DB0F95C023C84185CA752AB806000000488B9C2478010000488B4D604833CCE8%x%x%x%x%x%x004881C480010000415F"
  L29_2 = {}
  L29_2.DeepInstinct64 = "^4883EC08C7"
  L29_2.DeepInstinct32 = "^83EC04C7"
  L30_2 = "^48B8................FFE0"
  L31_2 = isnull
  L32_2 = A0_2
  L31_2 = L31_2(L32_2)
  if not L31_2 then
    L31_2 = isnull
    L32_2 = A1_2
    L31_2 = L31_2(L32_2)
    if not L31_2 then
      L31_2 = isnull
      L32_2 = A3_2
      L31_2 = L31_2(L32_2)
      if not L31_2 then
        L31_2 = isnull
        L32_2 = A4_2
        L31_2 = L31_2(L32_2)
        if not L31_2 then
          L31_2 = isnull
          L32_2 = A5_2
          L31_2 = L31_2(L32_2)
          if not L31_2 then
            L31_2 = isnull
            L32_2 = A6_2
            L31_2 = L31_2(L32_2)
            if not L31_2 then
              L31_2 = isnull
              L32_2 = A7_2
              L31_2 = L31_2(L32_2)
              if not L31_2 then
                goto lbl_150
              end
            end
          end
        end
      end
    end
  end
  L31_2 = false
  do return L31_2 end
  ::lbl_150::
  L31_2 = A4_2.BadInstruction
  if not L31_2 then
    L31_2 = A4_2.FunctionBase
    if not L31_2 then
      L31_2 = A4_2.KnownBad
      if not L31_2 then
        L31_2 = false
        return L31_2
      end
    end
  end
  L31_2 = pcall
  L32_2 = bm
  L32_2 = L32_2.GetModAddress
  L33_2 = A1_2
  L34_2 = A3_2
  L31_2, L32_2 = L31_2(L32_2, L33_2, L34_2)
  if not L31_2 or not L32_2 then
    L33_2 = false
    return L33_2
  end
  L33_2 = ""
  L34_2 = A4_2.FunctionBase
  if L34_2 then
    L34_2 = mp
    L34_2 = L34_2.SIGATTR_LOG_SZ
    if 0 < L34_2 then
      L34_2 = string
      L34_2 = L34_2.gsub
      L35_2 = A1_2
      L36_2 = ",ProcessStart"
      L37_2 = ""
      L34_2 = L34_2(L35_2, L36_2, L37_2)
      L35_2 = mp
      L35_2 = L35_2.SIGATTR_LOG_SZ
      L36_2 = 1
      L37_2 = -1
      for L38_2 = L35_2, L36_2, L37_2 do
        L39_2 = sigattr_tail
        L39_2 = L39_2[L38_2]
        if A2_2 then
          L40_2 = isnull
          L41_2 = L39_2.attribute
          L40_2 = L40_2(L41_2)
          if not L40_2 then
            L40_2 = L39_2.attribute
            if L40_2 == 16522 then
              L40_2 = isnull
              L41_2 = L39_2.utf8p1
              L40_2 = L40_2(L41_2)
              if not L40_2 then
                L40_2 = isnull
                L41_2 = L39_2.utf8p2
                L40_2 = L40_2(L41_2)
                if not L40_2 then
                  L40_2 = string
                  L40_2 = L40_2.find
                  L41_2 = L39_2.utf8p1
                  L42_2 = L34_2
                  L43_2 = 1
                  L44_2 = true
                  L40_2 = L40_2(L41_2, L42_2, L43_2, L44_2)
                  if L40_2 then
                    L40_2 = string
                    L40_2 = L40_2.find
                    L41_2 = L39_2.utf8p2
                    L42_2 = "vmbaseaddress:%d+;.-lastprotectionmask:32"
                    L40_2 = L40_2(L41_2, L42_2)
                    if L40_2 then
                      L40_2 = string
                      L40_2 = L40_2.match
                      L41_2 = L39_2.utf8p2
                      L42_2 = "vmbaseaddress:(%d+);"
                      L40_2 = L40_2(L41_2, L42_2)
                      L41_2 = isnull
                      L42_2 = L40_2
                      L41_2 = L41_2(L42_2)
                      if not L41_2 then
                        L41_2 = string
                        L41_2 = L41_2.format
                        L42_2 = "%s;%s"
                        L43_2 = L33_2
                        L44_2 = L40_2
                        L41_2 = L41_2(L42_2, L43_2, L44_2)
                        L33_2 = L41_2
                      end
                  end
                end
              end
            end
          end
        end
        elseif not A2_2 then
          L40_2 = isnull
          L41_2 = L39_2.attribute
          L40_2 = L40_2(L41_2)
          if not L40_2 then
            L40_2 = L39_2.attribute
            if L40_2 == 16505 then
              L40_2 = isnull
              L41_2 = L39_2.utf8p1
              L40_2 = L40_2(L41_2)
              if not L40_2 then
                L40_2 = isnull
                L41_2 = L39_2.utf8p2
                L40_2 = L40_2(L41_2)
                if not L40_2 then
                  L40_2 = string
                  L40_2 = L40_2.find
                  L41_2 = L39_2.utf8p1
                  L42_2 = "32:"
                  L43_2 = 1
                  L44_2 = true
                  L40_2 = L40_2(L41_2, L42_2, L43_2, L44_2)
                  if not L40_2 then
                    L40_2 = L39_2.utf8p1
                    if L40_2 ~= "4:32" then
                      goto lbl_304
                    end
                    L40_2 = string
                    L40_2 = L40_2.find
                    L41_2 = L39_2.utf8p2
                    L42_2 = "vavadmmfname:.."
                    L40_2 = L40_2(L41_2, L42_2)
                    if L40_2 then
                      goto lbl_304
                    end
                  end
                  L40_2 = string
                  L40_2 = L40_2.match
                  L41_2 = L39_2.utf8p2
                  L42_2 = "^(%d+);"
                  L40_2 = L40_2(L41_2, L42_2)
                  L41_2 = isnull
                  L42_2 = L40_2
                  L41_2 = L41_2(L42_2)
                  if not L41_2 then
                    L41_2 = string
                    L41_2 = L41_2.format
                    L42_2 = "%s;%s"
                    L43_2 = L33_2
                    L44_2 = L40_2
                    L41_2 = L41_2(L42_2, L43_2, L44_2)
                    L33_2 = L41_2
                  end
                end
              end
            end
          end
        end
        ::lbl_304::
      end
    end
  end
  if L33_2 == "" then
    L34_2 = A4_2.BadInstruction
    if not L34_2 then
      L34_2 = false
      return L34_2
    end
  end
  L34_2 = pairs
  L35_2 = A5_2
  L34_2, L35_2, L36_2 = L34_2(L35_2)
  for L37_2, L38_2 in L34_2, L35_2, L36_2 do
    L39_2 = pcall
    L40_2 = bm
    L40_2 = L40_2.GetProcAddress
    L41_2 = A1_2
    L42_2 = A3_2
    L43_2 = L38_2
    L39_2, L40_2 = L39_2(L40_2, L41_2, L42_2, L43_2)
    L12_2 = L40_2
    L31_2 = L39_2
    if L12_2 then
      if 4294967295 < L12_2 then
        L39_2 = mp
        L39_2 = L39_2.SMS_PROC_ARCH_X64
        if L39_2 then
          goto lbl_335
          L10_2 = L39_2 or L10_2
        end
      end
      L39_2 = mp
      L10_2 = L39_2.SMS_PROC_ARCH_X32
      ::lbl_335::
      L39_2 = pcall
      L40_2 = bm
      L40_2 = L40_2.VirtualQuery
      L41_2 = L12_2
      L42_2 = A1_2
      L39_2, L40_2, L41_2 = L39_2(L40_2, L41_2, L42_2)
      if not L40_2 then
        break
      end
      L42_2 = pcall
      L43_2 = bm
      L43_2 = L43_2.ReadProcMem
      L44_2 = L12_2
      L45_2 = L18_2
      L46_2 = A1_2
      L42_2, L43_2 = L42_2(L43_2, L44_2, L45_2, L46_2)
      L16_2 = L43_2
      L31_2 = L42_2
      if not L31_2 or not L16_2 then
        break
      end
      L42_2 = tohex
      L43_2 = L16_2
      L42_2 = L42_2(L43_2)
      L15_2 = L42_2
      L42_2 = mp
      L42_2 = L42_2.crc32
      L43_2 = 0
      L44_2 = L15_2
      L45_2 = 1
      L46_2 = 0
      L42_2 = L42_2(L43_2, L44_2, L45_2, L46_2)
      L13_2 = L42_2
      L42_2 = L27_2[L38_2]
      if L42_2 then
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L27_2[L38_2]
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
      end
      if L38_2 == "AmsiOpenSession" then
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiOpenSession2
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiOpenSession3
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiOpenSession4
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiOpenSession5
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
      end
      if L38_2 == "AmsiScanString" then
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiScanString2
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.AmsiScanString3
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
      end
      L42_2 = string
      L42_2 = L42_2.find
      L43_2 = L15_2
      L44_2 = L29_2.DeepInstinct64
      L42_2 = L42_2(L43_2, L44_2)
      if L42_2 then
        break
      end
      L42_2 = string
      L42_2 = L42_2.find
      L43_2 = L15_2
      L44_2 = L29_2.DeepInstinct32
      L42_2 = L42_2(L43_2, L44_2)
      if L42_2 then
        break
      end
      L42_2 = A4_2.FunctionBase
      if L42_2 and L38_2 == "EtwEventWrite" then
        if L13_2 == 462378421 then
          break
        end
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L28_2.EtwEventWrite2
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          break
        end
      end
      L42_2 = A4_2.KnownBad
      if L42_2 then
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L15_2
        L44_2 = L30_2
        L42_2 = L42_2(L43_2, L44_2)
        if L42_2 then
          L42_2 = true
          L25_2 = "KnownBad"
          L23_2 = L42_2
          L42_2 = {}
          L42_2.ProcName = A0_2
          L42_2.DLLName = A3_2
          L42_2.TamperType = L25_2
          L42_2.FuncName = L38_2
          L42_2.FuncAddr = L12_2
          L43_2 = tostring
          L44_2 = L13_2
          L43_2 = L43_2(L44_2)
          L42_2.CRC32 = L43_2
          L42_2.CpuArch = L10_2
          L42_2.ProcRemote = A2_2
          L42_2.EncMem = L15_2
          L11_2 = L42_2
          L42_2 = safeJsonSerialize
          L43_2 = L11_2
          L42_2 = L42_2(L43_2)
          L24_2 = L42_2
        end
      end
      L42_2 = A4_2.FunctionBase
      if L42_2 and L33_2 ~= "" then
        L42_2 = string
        L42_2 = L42_2.find
        L43_2 = L33_2
        L44_2 = tostring
        L45_2 = L41_2.base_addr
        L44_2 = L44_2(L45_2)
        L45_2 = 1
        L46_2 = true
        L42_2 = L42_2(L43_2, L44_2, L45_2, L46_2)
        if L42_2 then
          L42_2 = true
          L25_2 = "FunctionBase"
          L23_2 = L42_2
          L42_2 = {}
          L42_2.ProcName = A0_2
          L42_2.DLLName = A3_2
          L42_2.TamperType = L25_2
          L42_2.FuncName = L38_2
          L42_2.FuncAddr = L12_2
          L43_2 = L41_2.base_addr
          L42_2.BaseAddr = L43_2
          L42_2.ProcRemote = A2_2
          L42_2.EncMem = L15_2
          L43_2 = tostring
          L44_2 = L13_2
          L43_2 = L43_2(L44_2)
          L42_2.CRC32 = L43_2
          L11_2 = L42_2
          L42_2 = safeJsonSerialize
          L43_2 = L11_2
          L42_2 = L42_2(L43_2)
          L24_2 = L42_2
        end
      end
      L42_2 = A4_2.BadInstruction
      if L42_2 then
        L42_2 = mp
        L42_2 = L42_2.x86dasm
        L43_2 = L10_2
        L44_2 = L12_2
        L45_2 = L16_2
        L46_2 = #L16_2
        L47_2 = A7_2
        L48_2 = L12_2
        L49_2 = mp
        L49_2 = L49_2.DASM_BREAK_ON_JMP
        L50_2 = mp
        L50_2 = L50_2.DASM_BREAK_ON_IJMP
        L49_2 = L49_2 + L50_2
        L42_2 = L42_2(L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2)
        L14_2 = L42_2
        if not L14_2 then
          break
        end
        L42_2 = pairs
        L43_2 = L14_2
        L42_2, L43_2, L44_2 = L42_2(L43_2)
        for L45_2, L46_2 in L42_2, L43_2, L44_2 do
          L47_2 = L46_2.opcode
          L47_2 = A6_2[L47_2]
          if L47_2 then
            L47_2 = L46_2.opcode
            if L47_2 ~= 51 then
              L47_2 = L46_2.opcode
              if L47_2 ~= 49 then
                goto lbl_562
              end
            end
            L47_2 = L46_2.modrm
            ::lbl_562::
            if L47_2 == 192 then
              L47_2 = true
              L25_2 = "BadInstruction"
              L23_2 = L47_2
              L47_2 = {}
              L47_2.ProcName = A0_2
              L47_2.DLLName = A3_2
              L47_2.TamperType = L25_2
              L47_2.FuncName = L38_2
              L47_2.FuncAddr = L12_2
              L48_2 = L46_2.opcode
              L47_2.Instr = L48_2
              L48_2 = tostring
              L49_2 = L13_2
              L48_2 = L48_2(L49_2)
              L47_2.CRC32 = L48_2
              L47_2.CpuArch = L10_2
              L47_2.ProcRemote = A2_2
              L47_2.EncMem = L15_2
              L11_2 = L47_2
              L47_2 = safeJsonSerialize
              L48_2 = L11_2
              L47_2 = L47_2(L48_2)
              L24_2 = L47_2
              break
            end
          end
        end
      end
      if L23_2 then
        L42_2 = bm
        L42_2 = L42_2.add_related_string
        L43_2 = L20_2
        L44_2 = L24_2
        L45_2 = bm
        L45_2 = L45_2.RelatedStringBMReport
        L42_2(L43_2, L44_2, L45_2)
        L42_2 = TrackPidAndTechnique
        L43_2 = A1_2
        L44_2 = A9_2
        L45_2 = string
        L45_2 = L45_2.format
        L46_2 = "%s_%s_%s_%s"
        L47_2 = A8_2
        L48_2 = L26_2
        L49_2 = A3_2
        L50_2 = L25_2
        L45_2, L46_2, L47_2, L48_2, L49_2, L50_2 = L45_2(L46_2, L47_2, L48_2, L49_2, L50_2)
        L42_2(L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2)
        L23_2 = false
        L22_2 = L22_2 + 1
      end
    end
  end
  if 0 < L22_2 then
    if A2_2 then
      L34_2 = bm
      L34_2 = L34_2.add_related_process
      L35_2 = A1_2
      L34_2(L35_2)
      L34_2 = MpCommon
      L34_2 = L34_2.SetTaintedProcess
      L35_2 = A1_2
      L36_2 = bm
      L36_2 = L36_2.BM_TAINT_PROTECTVM
      L34_2(L35_2, L36_2)
    else
      L34_2 = bm
      L34_2 = L34_2.request_SMS
      L35_2 = A1_2
      L36_2 = "m"
      L34_2(L35_2, L36_2)
    end
    L34_2 = true
    return L34_2
  end
  L34_2 = false
  return L34_2
end

found_api_tampering = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "://"
  L4_2 = 1
  L5_2 = true
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L3_2 = A0_2
  if L1_2 and L2_2 then
    L4_2 = string
    L4_2 = L4_2.sub
    L5_2 = A0_2
    L6_2 = L2_2 + 1
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = L3_2
  L6_2 = "/"
  L7_2 = 1
  L8_2 = true
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L2_2 = L5_2
  L1_2 = L4_2
  if L1_2 then
    L4_2 = string
    L4_2 = L4_2.sub
    L5_2 = L3_2
    L6_2 = 1
    L7_2 = L1_2 - 1
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2 = L4_2
  end
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = L3_2
  L6_2 = "[%.%w%d-]+"
  L4_2 = L4_2(L5_2, L6_2)
  return L4_2
end

get_host_name = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = isnull
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = nil
    return L1_2
  else
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = A0_2
    L3_2 = "%d+%.%d+%.%d+%.%d+"
    L4_2 = 1
    L5_2 = false
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
end

is_valid_ip = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = get_host_name
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = A0_2
  end
  L2_2 = is_valid_ip
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = false
  if L2_2 then
    L4_2 = isPublicIP
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2 = not L4_2
  end
  return L3_2
end

is_internal_ip = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = get_host_name
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = A0_2
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = L1_2
  L4_2 = "%.[a-zA-Z][a-zA-Z]+$"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = L1_2
  L5_2 = "%.local$"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = isnull
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = is_valid_ip
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = is_internal_ip
    L4_2 = L1_2
    return L3_2(L4_2)
  end
  L3_2 = true
  return L3_2
end

is_internal_domain = L3_1

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = isnull
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = {}
    return L1_2
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = string
    L1_3 = L1_3.gsub
    L2_3 = A0_3
    L3_3 = "[,;%)}%]\\]$"
    L4_3 = ""
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    A0_3 = L1_3
    L1_3 = string
    L1_3 = L1_3.gsub
    L2_3 = A0_3
    L3_3 = "\\+$"
    L4_3 = ""
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    A0_3 = L1_3
    L1_3 = is_internal_ip
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = is_internal_domain
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      if not L1_3 then
        L1_3 = string
        L1_3 = L1_3.match
        L2_3 = A0_3
        L3_3 = "^[hH][tT]+[pP][sS]?://([^/]+)"
        L1_3 = L1_3(L2_3, L3_3)
        if not L1_3 then
          L1_3 = string
          L1_3 = L1_3.match
          L2_3 = A0_3
          L3_3 = "^([^/]+)"
          L1_3 = L1_3(L2_3, L3_3)
        end
        if L1_3 then
          L2_3 = L3_2
          L2_3 = L2_3[L1_3]
          if not L2_3 then
            L2_3 = table
            L2_3 = L2_3.insert
            L3_3 = L1_2
            L4_3 = A0_3
            L2_3(L3_3, L4_3)
            L2_3 = table
            L2_3 = L2_3.insert
            L3_3 = L2_2
            L4_3 = L1_3
            L2_3(L3_3, L4_3)
            L2_3 = L3_2
            L2_3[L1_3] = true
            L2_3 = string
            L2_3 = L2_3.match
            L3_3 = L1_3
            L4_3 = "^www%.(.+)"
            L2_3 = L2_3(L3_3, L4_3)
            if L2_3 then
              L3_3 = L3_2
              L3_3[L2_3] = true
            end
          end
        end
      end
    end
  end
  
  L6_2 = A0_2
  L5_2 = A0_2.gsub
  L7_2 = "[\"']"
  L8_2 = ""
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "%+"
  L8_2 = ""
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "\\"
  L8_2 = ""
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "%s+"
  L8_2 = ""
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = string
  L6_2 = L6_2.gmatch
  L7_2 = A0_2
  L8_2 = "%-[Rr][Ee][Ss][Tt][Mm][Ee][Tt][Hh][Oo][Dd]%s*['\"]([^'\"]+)['\"]%)?"
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  for L9_2 in L6_2, L7_2, L8_2 do
    L10_2 = L4_2
    L11_2 = L9_2
    L10_2(L11_2)
  end
  L6_2 = false
  L7_2 = string
  L7_2 = L7_2.gmatch
  L8_2 = A0_2
  L9_2 = "([hH][tT]+[pP][sS]?://[^%s%\"'<>%(%)]+)"
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
  for L10_2 in L7_2, L8_2, L9_2 do
    L11_2 = L4_2
    L12_2 = L10_2
    L11_2(L12_2)
    L6_2 = true
  end
  if L6_2 == false then
    L7_2 = string
    L7_2 = L7_2.gmatch
    L8_2 = A0_2
    L9_2 = "([%w%-%.]+%.[a-zA-Z][a-zA-Z]+/[^%s%\"'<>,;%)%]}\\]+)"
    L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
    for L10_2 in L7_2, L8_2, L9_2 do
      L11_2 = string
      L11_2 = L11_2.match
      L12_2 = L10_2
      L13_2 = "^[%w%-%.]+%.[a-zA-Z][a-zA-Z]+/"
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 then
        L11_2 = L4_2
        L12_2 = L10_2
        L11_2(L12_2)
      end
    end
    L7_2 = string
    L7_2 = L7_2.gmatch
    L8_2 = L5_2
    L9_2 = "[\"']?[%w\\\"]+%.[a-zA-Z]+[\"']?"
    L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
    for L10_2 in L7_2, L8_2, L9_2 do
      L12_2 = L10_2
      L11_2 = L10_2.gsub
      L13_2 = "[\\\"']"
      L14_2 = ""
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L12_2 = #L11_2
      if 6 < L12_2 then
        L13_2 = L11_2
        L12_2 = L11_2.match
        L14_2 = "^[%w%-%.]+%.[a-zA-Z]+$"
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L12_2 = L4_2
          L13_2 = "http://"
          L14_2 = L11_2
          L13_2 = L13_2 .. L14_2
          L12_2(L13_2)
        end
      end
    end
  end
  L7_2 = "([^/\\%.vV_%-]%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?[^/\\%.vV_%-])"
  L8_2 = "|"
  L9_2 = "^(%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?[^/\\%.vV_%-])"
  L10_2 = "|"
  L11_2 = "([^/\\%.vV_%-]%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?)$"
  L12_2 = "|"
  L13_2 = "^(%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?)$"
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L8_2 = string
  L8_2 = L8_2.gmatch
  L9_2 = A0_2
  L10_2 = L7_2
  L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
  for L11_2 in L8_2, L9_2, L10_2 do
    L12_2 = is_valid_ip
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L13_2 = string
      L13_2 = L13_2.gsub
      L14_2 = L11_2
      L15_2 = "[,;%)}%]\\]$"
      L16_2 = ""
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L11_2 = L13_2
      L13_2 = string
      L13_2 = L13_2.gsub
      L14_2 = L11_2
      L15_2 = "\\+$"
      L16_2 = ""
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L11_2 = L13_2
      L13_2 = is_internal_ip
      L14_2 = L11_2
      L13_2 = L13_2(L14_2)
      if not L13_2 then
        L13_2 = L3_2[L11_2]
        if not L13_2 then
          L13_2 = table
          L13_2 = L13_2.insert
          L14_2 = L1_2
          L15_2 = L11_2
          L13_2(L14_2, L15_2)
          L3_2[L11_2] = true
        end
      end
    end
  end
  L8_2 = L1_2
  L9_2 = L2_2
  return L8_2, L9_2
end

extract_urls = L3_1

function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil then
    L7_2 = nil
    L8_2 = nil
    return L7_2, L8_2
  end
  if A1_2 == nil then
    L7_2 = nil
    L8_2 = nil
    return L7_2, L8_2
  end
  if not A2_2 then
    A2_2 = false
  end
  if not A3_2 then
    A3_2 = 2
  end
  if not A4_2 then
    A4_2 = 60
  end
  if not A5_2 then
    A5_2 = false
  end
  if not A6_2 then
    A6_2 = 2000
  end
  L7_2 = false
  L8_2 = {}
  
  function L9_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L4_3 = pcall
    L5_3 = mp
    L5_3 = L5_3.GetUrlReputation
    L6_3 = A0_3
    L7_3 = A1_3
    L8_3 = A2_3
    L9_3 = A3_3
    L4_3, L5_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    if L4_3 then
      L6_3 = L5_3.urls
      L7_3 = ipairs
      L8_3 = L6_3
      L7_3, L8_3, L9_3 = L7_3(L8_3)
      for L10_3, L11_3 in L7_3, L8_3, L9_3 do
        L12_3 = L11_3.determination
        L13_3 = A3_2
        if L12_3 == L13_3 then
          L12_3 = L11_3.confidence
          L13_3 = A4_2
          if L12_3 >= L13_3 then
            L12_3 = true
            L7_2 = L12_3
          end
        end
      end
      L7_3 = table
      L7_3 = L7_3.insert
      L8_3 = L8_2
      L9_3 = L6_3
      L7_3(L8_3, L9_3)
    end
  end
  
  L10_2 = extract_urls
  L11_2 = A0_2
  L10_2, L11_2 = L10_2(L11_2)
  L12_2 = isnull
  L13_2 = L10_2
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L12_2 = isnull
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      goto lbl_46
    end
  end
  L12_2 = nil
  L13_2 = nil
  do return L12_2, L13_2 end
  ::lbl_46::
  L11_2 = L11_2[1]
  L10_2 = L10_2[1]
  if A2_2 then
    L12_2 = nil
    L13_2 = string
    L13_2 = L13_2.match
    L14_2 = L11_2
    L15_2 = "^(https?)://"
    L13_2 = L13_2(L14_2, L15_2)
    if not L13_2 then
      L13_2 = string
      L13_2 = L13_2.match
      L14_2 = L10_2
      L15_2 = "^(https?)://"
      L13_2 = L13_2(L14_2, L15_2)
      L14_2 = L13_2
      L15_2 = "://"
      L16_2 = L11_2
      L11_2 = L14_2 .. L15_2 .. L16_2
      L15_2 = L11_2
      L14_2 = L11_2.match
      L16_2 = "://([^/]+)"
      L14_2 = L14_2(L15_2, L16_2)
      L15_2 = is_valid_ip
      L16_2 = L14_2
      L15_2 = L15_2(L16_2)
      if L15_2 then
        L12_2 = L14_2
      else
        L16_2 = L14_2
        L15_2 = L14_2.match
        L17_2 = "([^.]+%.[^.]+)$"
        L15_2 = L15_2(L16_2, L17_2)
        L12_2 = L15_2
      end
      if L12_2 then
        L15_2 = L13_2
        L16_2 = "://"
        L17_2 = L12_2
        L12_2 = L15_2 .. L16_2 .. L17_2
        if L11_2 == L12_2 then
          L12_2 = nil
        end
      end
    end
    if L12_2 then
      L13_2 = L9_2
      L14_2 = {}
      L15_2 = L12_2
      L14_2[1] = L15_2
      L15_2 = A1_2
      L16_2 = A5_2
      L17_2 = A6_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
    if L11_2 ~= L10_2 then
      L13_2 = L9_2
      L14_2 = {}
      L15_2 = L11_2
      L14_2[1] = L15_2
      L15_2 = A1_2
      L16_2 = A5_2
      L17_2 = A6_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  end
  L12_2 = L9_2
  L13_2 = {}
  L14_2 = L10_2
  L13_2[1] = L14_2
  L14_2 = A1_2
  L15_2 = A5_2
  L16_2 = A6_2
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = L7_2
  L13_2 = L8_2
  return L12_2, L13_2
end

ExtractUrlGetReputation = L3_1

function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = string
  L0_2 = L0_2.lower
  L1_2 = bm
  L1_2 = L1_2.get_imagepath
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  if L0_2 then
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = L0_2
    L3_2 = "\\crowdcrawlerworker.exe"
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = L0_2
      L3_2 = "\\search_engine_ranker.exe"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = L0_2
        L3_2 = "\\searchenginedata.exe"
        L4_2 = 1
        L5_2 = true
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = L0_2
          L3_2 = "\\net_updater32.exe"
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L1_2 = string
            L1_2 = L1_2.find
            L2_2 = L0_2
            L3_2 = "\\themaposter.exe"
            L4_2 = 1
            L5_2 = true
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L1_2 = string
              L1_2 = L1_2.find
              L2_2 = L0_2
              L3_2 = "\\blackhatseo.exe"
              L4_2 = 1
              L5_2 = true
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = L0_2
                L3_2 = "\\maw-aio.exe"
                L4_2 = 1
                L5_2 = true
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if not L1_2 then
                  L1_2 = string
                  L1_2 = L1_2.find
                  L2_2 = L0_2
                  L3_2 = "\\webcontact.exe"
                  L4_2 = 1
                  L5_2 = true
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if not L1_2 then
                    L1_2 = string
                    L1_2 = L1_2.find
                    L2_2 = L0_2
                    L3_2 = "\\sitecrawller.exe"
                    L4_2 = 1
                    L5_2 = true
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if not L1_2 then
                      L1_2 = string
                      L1_2 = L1_2.find
                      L2_2 = L0_2
                      L3_2 = "\\sidcraker.exe"
                      L4_2 = 1
                      L5_2 = true
                      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                      if not L1_2 then
                        L1_2 = string
                        L1_2 = L1_2.find
                        L2_2 = L0_2
                        L3_2 = "\\sidwpcraker.exe"
                        L4_2 = 1
                        L5_2 = true
                        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                        if not L1_2 then
                          L1_2 = string
                          L1_2 = L1_2.find
                          L2_2 = L0_2
                          L3_2 = "\\wp-brute.exe"
                          L4_2 = 1
                          L5_2 = true
                          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                          if not L1_2 then
                            L1_2 = string
                            L1_2 = L1_2.find
                            L2_2 = L0_2
                            L3_2 = "\\wp-cracker-v2.exe"
                            L4_2 = 1
                            L5_2 = true
                            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                            if not L1_2 then
                              goto lbl_128
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L1_2 = true
    return L1_2
  end
  ::lbl_128::
  L1_2 = false
  return L1_2
end

IsNoisyWebProc = L3_1
