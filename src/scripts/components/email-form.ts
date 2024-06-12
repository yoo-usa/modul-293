export const init = () => {
  interface MailOptions {
    email: string;
    subject: string;
    content: string;
  }

  const form = document.querySelector('.email-form') as HTMLFormElement;

  form.onsubmit = (event) => {
    event.preventDefault(); // Verhindert das normale Absenden des Formulars

    const email = (document.getElementById('email') as HTMLInputElement).value;
    const subject = (document.getElementById('subject') as HTMLInputElement).value;
    const content = (document.getElementById('email-content') as HTMLTextAreaElement).value;

    const mailOptions: MailOptions = {
      email,
      subject,
      content
    };

    sendMail(mailOptions);
  };

  function sendMail(options: MailOptions) {
    const encodedSubject = encodeURIComponent(options.subject);
    const encodedContent = encodeURIComponent(options.content);
    window.open(`mailto:${options.email}?subject=${encodedSubject}&body=${encodedContent}`);
  }
};
