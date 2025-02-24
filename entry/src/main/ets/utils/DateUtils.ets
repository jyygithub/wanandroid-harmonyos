export class DateUtils {
  // 格式化日期为 yyyy-MM-dd 格式
  static formatDate(date: Date | null | undefined): string {
    if (!date) {
      return ''; // 如果 date 为 null 或 undefined，返回空字符串
    }

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // 月份从0开始，所以加1
    const day = String(date.getDate()).padStart(2, '0'); // 补充前导零

    return `${year}-${month}-${day}`;
  }

  // 其他日期相关的工具方法可以在这里继续添加
  static parseDate(dateString: string): Date | null {
    const parsedDate = new Date(dateString);
    return isNaN(parsedDate.getTime()) ? null : parsedDate;
  }
}