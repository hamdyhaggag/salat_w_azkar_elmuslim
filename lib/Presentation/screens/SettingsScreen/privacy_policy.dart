import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

import '../../Widgets/custom_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'سياسة الخصوصية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl, // Set text direction to RTL
            child: Text(
              ' نهتم بخصوصيتك و سرية معلوماتك الشخصية ، فيما يلي نظرة عامة على كيفية جمع واستخدام المعلومات في تطبيقنا :\n\nمواقيت الصلاة واتجاه القبلة : \nنحن نجمع مواقيت الصلاة ومعلومات اتجاه القبلة لتوفير خدمات دقيقة ، هذه المعلومات تُخزَّن محليًا على جهازك ولا تُشارك مع جهات أخرى .\n\n  سبحة إلكترونية :\n يمكنك استخدام سبحة إلكترونية في التطبيق ، لا تتم مشاركة أي معلومات بهذا الصدد مع جهات خارجية .\n\nإعلانات : \nقد يحتوي التطبيق على إعلانات مستقبلاً ، في حالة حدوث ذلك سيتم استخدام شبكات إعلانية موثوقة تستند إلى معايير خصوصية صارمة بحيث لا يتم مشاركة معلومات شخصية مع الإعلانات .\n\n تحليلات :\nنجمع بيانات مجمعة ومجهولة المصدر حول استخدام التطبيق لتحسين أدائه و تجربة المستخدم حيث أن هذه البيانات لا تتضمن معلومات شخصية .\n\nنحن ملتزمون بحماية خصوصيتك ونأخذ إجراءات تقنية وتنظيمية لضمان أمان معلوماتك ، إذا كان لديك أي أسئلة إضافية حول سياسة الخصوصية، فلا تتردد في التواصل معنا .',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
