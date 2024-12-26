import { rcp } from "@kit.RemoteCommunicationKit"

export class CookiesUtils {
  static formatWanAndroidCookies(cookies: rcp.ResponseCookie[]): string {
    try {
      const formattedCookies = cookies.map(line => {
        return `${line.name}=${line.value}`
      }).join('; ')
      return formattedCookies
    } catch (e) {
      return ""
    }
  }
}