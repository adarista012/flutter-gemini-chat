import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_vertex/app/ui/home/home_provider.dart';
import 'package:flutter_vertex/app/ui/home/widgets/icon_send_message.dart';
import 'package:flutter_vertex/app/ui/home/widgets/message_widget.dart';
import 'package:flutter_vertex/app/ui/home/widgets/user_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withAlpha(40),
                  child: Consumer(builder: (context, ref, __) {
                    final controller = ref.watch(homeProvider);
                    return ListView.builder(
                      controller: controller.scrollController,
                      itemBuilder: (context, idx) {
                        var content = controller.generatedContent[idx];
                        return MessageWidget(
                          text: content.text,
                          image: null,
                          isFromUser: content.fromUser,
                        );
                      },
                      itemCount: controller.generatedContent.length,
                    );
                  }),
                ),
              ),
              Row(
                children: [
                  userTextField(homeProvider.read.textToPromp),
                  iconSendMessage(
                    homeProvider.read.send,
                    Theme.of(context).colorScheme.primary,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
